import numpy as np
import ctypes
import random

def tohex(val, nbits):
  return hex((val + (1 << nbits)) % (1 << nbits))

randomInts =  np.random.randint(low = -255, high =255, size = 512)
randomHexas = list(map(lambda x: "0x%08X" % (x & 0xffffffff), randomInts))

txtFileStr = ''
verilogFileStr = ''

for index, value in enumerate(randomHexas):
    txtFileStr += "{}\n".format(value)
    verilogFileStr += "rom[{0}] = 32'h{1};\n".format(index, value[2:])

with open("codigos.txt","w") as f:
    f.write(txtFileStr)

with open("verilogFileStr.txt","w") as f:
    f.write(verilogFileStr)

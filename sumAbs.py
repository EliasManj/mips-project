import numpy as np
import ctypes

with open("codigos.txt","r") as f:
    hexCodes = f.read().split("\n")
    hexCodes.pop()
    numCodes = list(map(lambda x: ctypes.c_int32(int(x, 16)).value, hexCodes))
    l0 = numCodes[0:int((len(numCodes)-1)/2)]
    l1 = numCodes[int(((len(numCodes)-1)/2)+1):-1]
    differences = [ abs(x - y) for x, y in zip(l0,l1)]
    numDiff = list(map(lambda x: int(x), differences))
    summ = 0
    for x in range(0,len(differences)):
        summ += numDiff[x]
    print(sum(numDiff))

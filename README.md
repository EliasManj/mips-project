# mips-project

Single cycle 32-bit mips implementation in verilog for Advanced Digital Systems class

## Running a program

Insert program instructions in intruction memory in rom.v at the initial begin

Example:
```
rom[0] = 32'h00000800; //ADD $1, $0, $0
rom[1] = 32'h2402000B; //ADDIU $2, $0, 11
rom[2] = 32'h8C230000; //LW $3, 0($1)
rom[3] = 32'h24210001; //ADDI $1, $1, 1
rom[4] = 32'h8C240000; //LW $4, 0($1)
rom[5] = 32'h04832800; //SLT $5, $4, $3
rom[6] = 32'h10A00002; //BEQ $5, $0, 1
rom[7] = 32'h00041800; //ADD $3, $4, $0
rom[8] = 32'h10220002; //BEQ $1, $2, $1
rom[9] = 32'h08000003; //JMP 2
rom[10] = 32'hAC230000;//SW $3, 0($1)
rom [11] = 32'h0800000B;//JMP11
```

Insert preloaded data memory at bufferini.list

Example:
```
00256322
03E416B3
0614C433
0CCB159E
0CAA3F89
000563F2
03ADFF5D
```

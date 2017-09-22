module main1(
	input clk,
	input counterLd,
	input counterRst
);

//Program counter
wire pcSrc;
wire [4:0] nextCount;

//ROM
wire [31:0] data;

//Instructions organized
wire [5:0] inst31_26 = data[31:26];
wire [4:0] inst25_21 = data[25:21]; 
wire [4:0] inst20_16 = data[20:16];
wire [4:0] inst15_11 = data[15:11];
wire [15:0] inst14_0 = data[14:0];
wire [4:0] inst4_0 = data[4:0];

//Control outputs
wire regDst;
wire regWrite;
wire aluSrc;
wire memRd;
wire memToReg;
//wire pcSrc;
wire jmp;
wire [2:0] aluOp;

progCounter progCounter(.clk(clk), .counterRst(counterRst), .jmp(jmp), .counterLd(counterLd), .shiftLeft2Out(inst4_0), .pcSrc(pcSrc), .nextCount(nextCount));
rom instructionMem(.clk(clk), .addr(nextCount), .data(data));
control control0(.inputData(inst31_26), .regDst(regDst), .regWrite(regWrite), .aluSrc(aluSrc), .memRd(memRd), .memToReg(memToReg), .pcSrc(pcSrc), .jmp(jmp), .aluOp(aluOp));



endmodule
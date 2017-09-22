module main2(
	input clk,
	input counterLd,
	input counterRst
);

//Program counter
wire pcSrcFinal;
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
wire [2:0] aluOp;
wire jmp;
wire pcSrc;

//Register file inputs/outputs
wire [4:0] wr_addr;
assign wr_addr = (regDst)? inst15_11 : inst20_16;
wire [31:0] wr_data;
wire [31:0] rd_data1;
wire [31:0] rd_data2;

//Alu inputs/outputs
wire [31:0] aluB;
assign aluB = (aluSrc)? {17'd0,inst14_0} : rd_data2;
wire zero;
wire [31:0] aluResult;

//PCsrc and
assign pcSrcFinal = pcSrc&zero;

//Ram
wire [31:0] data_out;

//Ram mux
wire rw = memRd;
assign wr_data = (memToReg)? data_out : aluResult;


//Program counter
progCounter progCounter(.clk(clk), .counterRst(counterRst), .jmp(jmp), .counterLd(counterLd), .shiftLeft2Out(inst4_0), .pcSrc(pcSrcFinal), .nextCount(nextCount));
//Instruction memory
rom instructionMem(.clk(clk), .addr(nextCount), .data(data));
//control
control control0(.inputData(inst31_26), .regDst(regDst), .regWrite(regWrite), .aluSrc(aluSrc), .memRd(memRd), .memToReg(memToReg), .pcSrc(pcSrc), .jmp(jmp), .aluOp(aluOp));
//Register file
reg_file regFile(.clk(clk), .rd_addr1(inst25_21), .rd_addr2(inst20_16), .wr_addr(wr_addr), .wr_data(wr_data), .wr_en(regWrite), .rd_data1(rd_data1), .rd_data2(rd_data2));
//alu
alu myAlu(.a(rd_data1), .b(aluB), .ctrlInput(aluOp), .zero(zero), .aluResult(aluResult));
//ram
genram2 genRam(.clk(clk), .addr(aluResult[3:0]), .rw(rw), .data_in(rd_data2), .data_out(data_out));

endmodule
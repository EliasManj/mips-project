module main0(
	input clk,
	input counterLd,
	input counterRst
);

//Program counter
wire [4:0] shiftLeft2Out;
wire pcSrc;
wire [4:0] nextCount;
wire jmp;

//ROM
wire [31:0] data;

progCounter progCounter(.clk(clk), .jmp(jmp), .counterRst(counterRst), .counterLd(counterLd), .shiftLeft2Out(shiftLeft2Out), .pcSrc(pcSrc), .nextCount(nextCount));
rom instructionMem(.clk(clk), .addr(nextCount), .data(data));

endmodule
module main0_tb;

//Inputs
reg clk;
reg counterLd;
reg counterRst;
reg [4:0] shiftLeft2Out;
reg pcSrc;
reg jmp;

//Conections
wire [4:0] nextCount;

//Outputs
wire [31:0] data;

progCounter progCounter(.clk(clk), .jmp(jmp), .counterRst(counterRst), .counterLd(counterLd), .shiftLeft2Out(shiftLeft2Out), .pcSrc(pcSrc), .nextCount(nextCount));
rom instructionMem(.clk(clk), .addr(nextCount), .data(data));

initial begin

	clk = 0;
	counterRst = 1;
	counterLd = 0;
	pcSrc = 0;
	shiftLeft2Out = 0;
	jmp = 0;
	
	#20;
	
	counterRst = 0;
	counterLd = 1;
	
end

initial begin
    forever #5 clk=~clk;
end

endmodule
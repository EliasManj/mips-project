	module progCounter(
	input clk,
	input counterRst,
	input counterLd,
	input [4:0] shiftLeft2Out,
	input pcSrc,
	input jmp,
	output reg [4:0] nextCount
);

wire [4:0] firstAdderOut;
wire [4:0] secondAdderOut;
wire [4:0] muxOut;
wire [4:0] jmpOut;

genAdder firstAdder(.value1(nextCount), .value2(5'd1), .sum(firstAdderOut));
genAdder secondAdder(.value1(firstAdderOut), .value2(shiftLeft2Out-5'd1), .sum(secondAdderOut));



assign muxOut = (pcSrc)? secondAdderOut : firstAdderOut;
assign jmpOut = (jmp)? shiftLeft2Out : muxOut;

always @(posedge clk) begin
	if (counterRst)
		nextCount <= 5'b0000;
	else if (counterLd)
		nextCount <= jmpOut;
end



endmodule
module rom_tb;

reg clk;
reg [4:0] addr;
wire [31:0] data;

rom uut(.clk(clk), .addr(addr), .data(data));

initial begin

	clk = 0;
	
	#5;
	addr = 0;
	#5;
	#5;
	
	#10;
	addr = 1;
	
	#10;
	addr = 2;
	
	#10;
	addr = 3;
	
	#10;
	addr = 4;
	
	
end

initial begin
	forever #5 clk=~clk;
end

endmodule
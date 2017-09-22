module genram2_tb;

localparam AW = 4;
localparam DW = 32;

reg clk;
reg [AW-1:0] addr;
reg rw;
reg [DW-1:0] data_in;
wire[DW-1:0] data_out;

genram2 uut(.clk(clk), .addr(addr), .rw(rw), .data_in(data_in), .data_out(data_out));

initial begin
	clk = 0;
	rw = 0;
	addr = 0;
	data_in = 0;
	
	#20;
	
	rw = 1;
	addr = 1;
	
	#20;
	addr = 2;
	
	#20;
	addr = 3;
	
	#20;
	rw = 0;
	addr = 1;
	data_in = 32'hffffffff;
	
	#20;
	rw = 1;
	addr = 1;
	
	#20;
	rw = 1;
	addr = 4;
	
end


initial begin
	forever #5 clk=~clk;
end

endmodule
module customSad_tb;

	reg clk;
	reg [31:0] a_data;
	reg [31:0] b_data;
	reg i_inc;
	reg i_clr;
	reg sum_ld;
	reg sum_clr;
	reg sadreg_ld;
	reg sadreg_clr;
	wire [31:0] sad;
	wire [8:0] ab_addr;
	wire i_ld_256;

	customSad uut(.clk(clk), .a_data(a_data), .b_data(b_data), .i_inc(i_inc), .i_clr(i_clr), .sum_ld(sum_ld), .sum_clr(sum_clr), .sadreg_ld(sadreg_ld), .sadreg_clr(sadreg_clr), .sad(sad), .ab_addr(ab_addr), .i_ld_256(i_ld_256));


initial begin

	clk = 0;
	a_data = 50;
	b_data = 100;
	i_inc = 0;
	i_clr = 1;
	sum_ld = 0;
	sum_clr = 1;
	sadreg_ld = 0;
	sadreg_clr = 1;

	#20;

	i_clr = 0;
	sum_clr = 0;
	sadreg_clr = 0;

	i_inc = 1;
	sum_ld = 1;
	sadreg_ld = 1;

	#20;

	i_inc = 1;
	sum_ld = 1;
	sadreg_ld = 1;

end

initial begin
    forever #5 clk=~clk;
end


endmodule

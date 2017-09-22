module sad_main(
	input go,
	input rst,
	input clk
);

wire i_lt_256;
wire sum_clr;
wire i_inc;
wire i_clr;
wire sum_ld;
wire AB_rd;
wire sadreg_ld;
wire sadreg_clr;
wire [31:0] a_data;
wire [31:0] b_data;
wire [31:0] sad;
wire [8:0] ab_addr;

SAD_FSM fsm(.go(go), .clk(clk), .rst(rst), .i_lt_256(i_lt_256), .sum_clr(sum_clr), .i_inc(i_inc), .i_clr(i_clr), .sum_ld(sum_ld), .AB_rd(AB_rd), .sadreg_ld(sadreg_ld), .sadreg_clr(sadreg_clr));
customSad sad0(.clk(clk), .a_data(a_data), .b_data(b_data), .i_inc(i_inc), .i_clr(i_clr), .sum_ld(sum_ld), .sum_clr(sum_clr), .sadreg_ld(sadreg_ld), .sadreg_clr(sadreg_clr), .sad(sad), .ab_addr(ab_addr), .i_lt_256(i_lt_256));
sad_rom_test rom(.addr(ab_addr), .dataA(a_data), .dataB(b_data));

endmodule

module customSad(
	input clk,
	input signed [31:0] a_data,
	input signed [31:0] b_data,
	input i_inc,
	input i_clr,
	input sum_ld,
	input sum_clr,
	input sadreg_ld,
	input sadreg_clr,
	output reg signed [31:0] sad,
	output reg [8:0] ab_addr,
	output i_lt_256
);

wire signed [31:0] diff = a_data - b_data;
wire signed [31:0] abs = diff[31] ? -diff : diff;
reg [31:0] sumReg;
wire [31:0] sum = abs + sumReg;

assign i_lt_256 = (ab_addr == 9'd7)? 1'b0 : 1'b1;


always @(posedge clk) begin
	if (sum_clr)
		sumReg <= 32'd0;
	else if (sum_ld)
		sumReg <= sum;
end

always @(posedge clk) begin
	if (sadreg_clr)
		sad <= 32'd0;
	else if (sadreg_ld)
		sad <= sum;
end

always @(posedge clk) begin
	if (i_clr)
		ab_addr <= 9'd0;
	else if (i_inc)
		ab_addr <= ab_addr + 9'd1;
end

endmodule

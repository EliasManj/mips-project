//`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:22:49 09/06/2014
// Design Name:   regfileII
// Module Name:   C:/Verilog/regfile/tb_regfile.v
// Project Name:  regfile
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regfileII
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "defines.v"

module tb_regfile;

	localparam SIZE 	= 32;
	localparam NUM_REGS 	= 32;

	// Inputs
	reg clk;
	reg [SIZE-1:0] W_data;
	reg [(`CLOG2(NUM_REGS))-1:0] W_addr;
	reg W_en;
	reg [(`CLOG2(NUM_REGS))-1:0] R_addr1;
	reg [(`CLOG2(NUM_REGS))-1:0] R_addr2;

	// Outputs
	wire [SIZE-1:0] R_data1;
	wire [SIZE-1:0] R_data2;

	// Instantiate the Unit Under Test (UUT)
	reg_file #(NUM_REGS,SIZE) uut (
		.clk(clk), 
		.wr_data(W_data), 
		.wr_addr(W_addr), 
		.wr_en(W_en), 
		.rd_addr1(R_addr1), 
		.rd_addr2(R_addr2),
		.rd_data1(R_data1),
		.rd_data2(R_data2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		W_data = 0;
		W_addr = 0;
		W_en = 0;
		R_addr1 = 0;

		// Wait 100 ns for global reset to finish
		#20;

		W_data = 8'hFF;
		W_addr = 0;
		W_en = 1;
		R_addr1 = 0;

		#10;
		W_data = 8'h00;
		W_addr = 1;
		
		#10;
		R_addr1 = 1;
		
		#5;
		W_data = 8'h77;
		W_addr = 3;
		
		#10;
		R_addr2 = 3;
		R_addr1 = 3;
		
		#5;
		W_data = 8'h77;
		W_addr = 0;
		
		#10;
		R_addr2 = 0;
		R_addr1 = 0;
		
		#5;
		W_data = 8'hEE;
		W_addr = 6;
		
		#10;
		R_addr2 = 6;
		R_addr1 = 6;
		
	

		
	
		
		// Add stimulus here

	end
      
	initial begin
	
		forever #5 clk = ~clk;
	end

endmodule
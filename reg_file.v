// Author:  Leonel Haro
// Description:    Parameterizable Register File with out reset, to match 1st Partial Exam HLSM problem specification.
//    This is a single write port & single read port Register file -
//    Read happens combinationaly merely by setting the desired register to be read in the rd_addr input -
//


module reg_file
#(
  parameter NUM_REGS = 32,
  parameter SIZE = 32
)(
  input clk,
  input  [4:0]  wr_addr,
  input         wr_en,
  input  [31:0] wr_data,
  input  [4:0]  rd_addr1,
  input  [4:0]  rd_addr2,
  output [31:0] rd_data1,
  output [31:0] rd_data2
);

    reg [SIZE-1:0] rf [NUM_REGS-1:0];
	 initial rf[0] = 32'd0;
	 initial rf[31] = 32'd255;


    always @ (posedge clk)
      if (wr_en && wr_addr != 0)
        rf[wr_addr] <= wr_data;


   assign rd_data1 = rf[rd_addr1];
   assign rd_data2 = rf[rd_addr2];

endmodule

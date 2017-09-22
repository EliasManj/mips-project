module sadFSM_tb;
  
	reg go;
	reg clk;
	reg rst;
	reg i_lt_256;
	wire sum_clr;
	wire i_inc;
	wire i_clr;
	wire sum_ld;
	wire AB_rd;
	wire sadreg_ld;
	wire sadreg_clr;
	
	reg [2:0] State, NextState;
  
  SAD_FSM uut (.go(go), .clk(clk), .rst(rst), .i_lt_256(i_lt_256), .sum_clr(sum_clr), .i_inc(i_inc), .i_clr(i_clr), .sum_ld(sum_ld), .AB_rd(AB_rd), .sadreg_ld(sadreg_lg), .sadreg_clr(sadreg_clr));
 
initial begin
  
  clk = 0;
  go = 0; 
  rst = 1; 
  i_lt_256 = 0; 
  
  #20;
  i_lt_256 = 1;
  rst = 0; 
  
  #20;
  
  

  #20;
  go = 1; 
  
  #100;
  i_lt_256 = 0;
  
  #200;
  i_lt_256 = 1;
  
  #200;
  i_lt_256 = 0;
  go = 0;
  
  #30;
  go = 1;
  i_lt_256 = 1;
  
  
  

  





  
  
end






initial begin 
  forever #5 clk=~clk;
end


endmodule
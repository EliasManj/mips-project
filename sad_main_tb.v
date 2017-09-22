module sad_main_tb;
	
reg go;
reg rst;
reg clk;	
	
sad_main uut(.go(go), .rst(rst), .clk(clk));
	
initial begin 
	
	clk = 0;
	rst = 1;
	go = 0;
	
	#30;
	
	rst = 0;
	go = 1;
	
	#10;
	go = 0;
	
end

initial begin 
  forever #5 clk=~clk;
end
	
endmodule
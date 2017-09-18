module main2_tb;

//Inputs programcounter
reg clk;
reg counterLd;
reg counterRst;


main2 myMain2(.clk(clk), .counterLd(counterLd), .counterRst(counterRst));

initial begin

	clk = 0;
	counterRst = 1;
	counterLd = 0;

	
	#20;
	
	counterRst = 0;
	counterLd = 1;
	
end

initial begin
    forever #5 clk=~clk;
end

endmodule
module alu_tb;

reg [31:0] a;
reg [31:0] b;
reg [2:0] ctrlInput;
wire zero;
wire [31:0] aluResult;

alu uut(.a(a), .b(b), .ctrlInput(ctrlInput), .zero(zero), .aluResult(aluResult));


initial begin
	#10;
	
	a = 32'd20;
	b = 32'd99;
	ctrlInput = 3'd0;
	
	#5;
	a = 32'd10;
	b = 32'd40;
	ctrlInput = 3'd1;
	
	#5;
	a = 32'd15;
	b = 32'd15;
	ctrlInput = 3'd2;
	
	#5;
	a = 32'd15;
	b = 32'd15;
	ctrlInput = 3'd3;
	
	#5;
	a = 32'd15;
	b = 32'd15;
	ctrlInput = 3'd4;
	
	#5;
	a = 32'd15;
	b = 32'd15;
	ctrlInput = 3'd5;
end 

endmodule
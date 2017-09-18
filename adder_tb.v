module adder_tb;

reg [4:0] a;
reg [4:0] b;
wire [4:0] sum;

genAdder uut(.value1(a), .value2(b), .sum(sum));

initial begin
  
  #10;
  
  a = 4;
  b = 5;
  
end

endmodule
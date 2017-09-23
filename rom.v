module rom (

input clk,
input wire [4:0] addr,
output reg [31:0] data
);

  reg [31:0] rom [0:31];

  always @ * begin
    data <= rom[addr];
  end

  initial begin
rom[0] = 32'h00002800;  //ADD $5, $0, $0
rom[1] = 32'h00000800;  //ADD $1, $0, $0
rom[2] = 32'h001F1000;  //ADD $2,$0,$31
rom[3] = 32'h8C230000;  //LW $3, 0($1)
rom[4] = 32'h8C240100;  //LW $4, 256($1)
rom[5] = 32'hC0643000;  //SUB $6, $3, $4
rom[6] = 32'hE0C70000;  //ABS $7, $6
rom[7] = 32'h00A72800;  //ADD $5, $7, $5
rom[8] = 32'h24210001;  //ADDIU $1, $1, 1
rom[9] = 32'h10220002;  //BEQ $1, $2, 1
rom[10] = 32'h08000003; //JMP 3
rom[11] = 32'hAFE50000; //SW $5, 0($7)
rom[12] = 32'h0800000C; //JMP12
   end
endmodule

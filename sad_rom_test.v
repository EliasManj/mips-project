module sad_rom_test (

input wire [8:0] addr,
output reg [31:0] dataA,
output reg [31:0] dataB
);

  reg [31:0] rom [0:31];

  always @ * begin
    dataA <= rom[addr];
	dataB <= rom[addr+8];
  end

  initial begin
rom[0] = 8'h00000001;
rom[1] = 8'h0000000F;
rom[2] = 8'h00000000;
rom[3] = 8'h00000005;
rom[4] = 8'h0000000A;
rom[5] = 8'h00000000;
rom[6] = 8'h00000000;
rom[7] = 8'h00000000;
rom[8] = 8'h00000000;
rom[9] = 8'h0000000E;
rom[10] = 8'h00000000;
rom[11] = 8'h00000001;
rom[12] = 8'h00000000;
rom[13] = 8'h000000e0;
rom[14] = 8'h00000022;
rom[15] = 8'h00000000;
   end
endmodule

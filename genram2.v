module genram2 #(             //-- Parametros
         parameter AW = 4,   //-- Bits de las direcciones (Adress width)
         parameter DW = 32	)   //-- Bits de los datos (Data witdh)

       (        //-- Puertos
         input clk,                      //-- Se�al de reloj global
         input wire [AW-1: 0] addr,      //-- Direcciones
         input wire rw,                  //-- Modo lectura (1) o escritura (0)
         input wire [DW-1: 0] data_in,   //-- Dato de entrada
         output reg [DW-1: 0] data_out); //-- Dato a escribir

//-- Parametro: Nombre del fichero con el contenido de la RAM



//-- Calcular el numero de posiciones totales de memoria
localparam NPOS = 2 ** AW;

  //-- Memoria
  reg [DW-1: 0] ram [0: NPOS-1];

initial ram[0] = 32'h00000001;
initial ram[1] = 32'h0000000F;
initial ram[2] = 32'h00000000;
initial ram[3] = 32'h00000000;
initial ram[4] = 32'h00000000;
initial ram[5] = 32'h00000000;
initial ram[6] = 32'h00000000;
initial ram[7] = 32'h00000000;
initial ram[8] = 32'h00000000;
initial ram[9] = 32'h0000000E;
initial ram[10] = 32'h0000000;
initial ram[11] = 32'h00000000;
initial ram[12] = 32'h00000000;
initial ram[13] = 32'h00000000;
initial ram[14] = 32'h00000000;
initial ram[15] = 32'h00000000;

  //-- Lectura de la memoria
  always @ * begin
    if (rw == 1)
    data_out <= ram[addr];
  end

  //-- Escritura en la memoria



  always @ * begin
    if (rw == 0)
     ram[addr] <= data_in;
  end




endmodule

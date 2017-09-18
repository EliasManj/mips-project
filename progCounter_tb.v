module progCounter_tb;
  
        reg counterRst; 
        reg clk;
        reg counterLd;
        reg [4:0] shiftLeftOut;
        reg pcSrc;
		reg jmp;
        wire [4:0] nextCount;
        
        progCounter cls1(.clk(clk), .jmp(jmp), .counterRst(counterRst), .counterLd(counterLd), .shiftLeft2Out(shiftLeftOut), .pcSrc(pcSrc), .nextCount(nextCount));
        
		
        initial begin
          
          //initialize
          counterLd = 0;
          clk = 0;
          counterRst = 1;
          pcSrc = 0;
          shiftLeftOut = 5'b0000;
		  jmp = 0;
          
          //run
          #90;
          counterRst = 0;
          counterLd = 1;
          
          #50;
          counterRst = 1;
			 
			#20;
			 counterRst = 0;
			 pcSrc = 1;
			 shiftLeftOut = 5'b0010;
			 
			#50;
			pcSrc = 0;
			jmp = 1;
			shiftLeftOut = 5'b0000;
			
			#10;
			jmp = 0;
			
          
        end
        
        initial begin
          forever #5 clk = ~clk;
        end
        
        
endmodule

module SAD_FSM(
	input go,
	input clk, 
	input rst,
	input i_lt_256,
	output sum_clr,
	output i_inc,
	output i_clr,
	output sum_ld,
	output AB_rd,
	output sadreg_ld,
	output sadreg_clr
   );
	parameter S0 = 3'b000,
				 S1 = 3'b001,
				 S2 = 3'b010,
				 S3 = 3'b011,
				 S4 = 3'b100;
			
	reg [2:0] State, NextState; 
	initial State = S0;
	
	always @ (posedge clk)
	begin
		if (rst == 1)
			State <= S0; 
		else 
			State <= NextState;
	end 
	
	assign i_clr = (State == S1)? 1 : 0;
	assign i_inc = (State == S3)? 1 : 0;
	assign sum_clr = (State == S1)? 1 : 0;
	assign sum_ld = i_inc;
	assign AB_rd = i_inc;
	assign sadreg_ld = (State == S4)? 1 : 0;
	assign sadreg_clr = (State == S1)? 1 : 0;
	
	always @ * begin
		case (State)
			S0: begin 
					if (go == 0)
					NextState <= S0;
					else 
					NextState <= S1;
				  end 
			S1: begin  
					NextState <= S2;
				  end
			S2: begin 
				 if (i_lt_256==1)
					NextState <= S3;
				 else
					NextState <= S4;
				 end
			S3: begin
				 NextState <= S2;
				  end
			S4: begin
				 NextState <= S0;
			     end
	endcase
	end			
		
endmodule


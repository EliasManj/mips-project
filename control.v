module control(
	input [5:0] inputData,
	output reg regDst,
	output reg regWrite,
	output reg aluSrc,
	output reg memRd,
	output reg memToReg,
	output reg pcSrc,
	output reg jmp,
	output reg [2:0] aluOp
);


always @ * begin
	case (inputData)
		0 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b1,1'b1,1'b0,1'b1,1'b0,1'b0, 1'b0, 3'b011}; //ADD
		1 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b1,1'b1,1'b0,1'b1,1'b0,1'b0, 1'b0, 3'b110}; //SLT
		2 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b0,1'b1,1'b0,1'b1,1'b0,1'b0, 1'b1, 3'b111}; //JMP
		4 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b0,1'b0,1'b0,1'b1,1'b0,1'b1, 1'b0, 3'b100}; //BEQ
		9 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b0,1'b1,1'b1,1'b1,1'b0,1'b0, 1'b0, 3'b011}; //ADDIU
	   35 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b0,1'b1,1'b1,1'b1,1'b1,1'b0, 1'b0, 3'b011}; //LW
	   43 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b0,1'b0,1'b1,1'b0,1'b0,1'b0, 1'b0, 3'b011}; //SW
	   48 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b1,1'b1,1'b0,1'b1,1'b0,1'b0, 1'b0, 3'b100}; //SUB
	   56 : {regDst, regWrite, aluSrc, memRd, memToReg, pcSrc, jmp, aluOp} = {1'b0,1'b1,1'b0,1'b1,1'b0,1'b0, 1'b0, 3'b10}; //ABS
	endcase
end


endmodule
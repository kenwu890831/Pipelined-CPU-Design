module TotalALU(a, b, opcode, immed, ctl, result, zero);

	input [31:0] a ;
	input [31:0] b ;
	input [5:0] opcode;
	input [15:0] immed ;
	input [2:0] ctl;
	output [31:0] result ;
	output zero;

	wire [5:0] funct;
	wire [31:0] ALUOut, ShifterOut, SltiOut ;

	assign funct = immed[5:0];
	
	alu ALU(a, b, ctl, ALUOut, zero);
	Shifter Shifter(b, immed[10:6], funct, ShifterOut);
	// slti SLTI(a, immed, SltiOut);

	assign result = (funct == 6'b000000) ? ShifterOut : 
					 ALUOut;

endmodule
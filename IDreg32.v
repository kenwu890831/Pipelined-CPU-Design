module ID_EXreg( clk, rst,in_pc,out_pc,In_RegDst, In_ALUSrc, In_MemtoReg, In_RegWrite, MemReain_d, In_MemWrite, In_Branch, In_Jump,In_ALUOp, 
			  Out_RegDst, Out_ALUSrc, Out_MemtoReg_, Out_RegWrite, d_MemReaout, Out_MemWrite, Out_Branch, Out_Jump,Out_ALUOp,
			  In_RD1, In_RD2, extend_immein_d,RD1_Out, RD2_Out, extend_immeout_d, rt_In, rin_d, rt_Out, rout_d,opcode_In, opcode_Out, operation_In, operation_Out, in_jump_addr, out_jump_addr);
	input clk, rst;
	input [31:0] in_pc ;
	output [31:0] out_pc ;
	input In_RegDst, In_ALUSrc, In_MemtoReg, In_RegWrite, MemReain_d, In_MemWrite, In_Branch, In_Jump ;
	input [1:0] In_ALUOp ;
	output Out_RegDst, Out_ALUSrc, Out_MemtoReg_, Out_RegWrite, d_MemReaout, Out_MemWrite, Out_Branch, Out_Jump ;
	output [1:0] Out_ALUOp ;
	input [31:0] In_RD1, In_RD2, extend_immein_d ;
	output [31:0] RD1_Out, RD2_Out, extend_immeout_d ;
	input [4:0] rt_In, rin_d ;
	output [4:0] rt_Out, rout_d ;
	input [5:0] opcode_In;
	output [5:0] opcode_Out;
	input [2:0] operation_In;
	output [2:0] operation_Out;
	input [31:0] in_jump_addr;
	output [31:0] out_jump_addr;
	
	reg [31:0] out_pc ;
	reg Out_RegDst, Out_ALUSrc, Out_MemtoReg_, Out_RegWrite, d_MemReaout, Out_MemWrite, Out_Branch, Out_Jump ;
	reg [1:0] Out_ALUOp ;
	reg [31:0] RD1_Out, RD2_Out, extend_immeout_d, out_jump_addr;
	reg [4:0] rt_Out, rout_d ;
	reg [5:0] opcode_Out;
	reg [2:0] operation_Out;

	always @( posedge clk ) begin
		if (rst) begin
			out_pc <= 32'b0;
			Out_RegDst <= 1'b0;
			Out_Jump <= 1'b0;
			Out_ALUOp <= 2'b0;
			RD1_Out <= 32'b0;
			RD2_Out <= 32'b0;
			extend_immeout_d <= 32'b0;
			rt_Out <= 4'b0;
			Out_ALUSrc <= 1'b0;
			Out_MemtoReg_ <= 1'b0;
			Out_RegWrite <= 1'b0;
			d_MemReaout <= 1'b0;
			Out_MemWrite <= 1'b0;
			Out_Branch <= 1'b0;
			rout_d <= 4'b0;
			Out_ALUOp <= 2'b0;
			RD1_Out <= 32'b0;
			RD2_Out <= 32'b0;
			extend_immeout_d <= 32'b0;
			opcode_Out <= 6'b0;
			operation_Out <= 3'b0;
			out_jump_addr <= 32'b0;
		end
		else begin
			out_pc <= in_pc ;
			Out_RegDst <= In_RegDst ;
			Out_ALUSrc <= In_ALUSrc ;
			Out_MemtoReg_ <= In_MemtoReg ;
			Out_RegWrite <= In_RegWrite ;
			d_MemReaout <= MemReain_d ;
			Out_MemWrite <= In_MemWrite ;
			Out_Branch <= In_Branch ;
			Out_Jump <= In_Jump ;
			Out_ALUOp <= In_ALUOp ;
			RD1_Out <= In_RD1 ;
			RD2_Out <= In_RD2 ;
			extend_immeout_d <= extend_immein_d ;
			rt_Out <= rt_In ;
			rout_d <= rin_d ;
			opcode_Out <= opcode_In ;
			operation_Out <= operation_In;
			out_jump_addr <= in_jump_addr;
		end
	end
		
endmodule
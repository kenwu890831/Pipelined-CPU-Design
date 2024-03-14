module IF_IDreg(clk, rst,in_pc ,instr_in, out_pc, instr_out);
	input clk, rst;
	input [31:0] in_pc, instr_in ;
	output [31:0] out_pc, instr_out ;
	reg [31:0] out_pc, instr_out ;

	
	always @( posedge clk ) begin
		if ( rst ) 
		begin
			out_pc <= 32'b0;
			instr_out <= 32'b0;
		end
		else begin
			out_pc <= in_pc ;
			instr_out <= instr_in ;
		end
	end
		
endmodule
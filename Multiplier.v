`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ; // 被乘數
input [31:0] dataB ; //乘數
input [5:0] Signal ;
output [63:0] dataOut ;


//   Signal ( 6-bits)?
//   MULTU  : 25

reg [63:0] temp ;
parameter MULTU = 6'b011001;

always@(posedge Signal)
begin
	if (Signal == MULTU)
	begin
		
	temp[63:32] = 32'b0 ;
	temp[31:0] = dataB ; 
	end
end

always@( posedge clk or reset )
begin
	if (reset)
	begin
		temp = 0;
	end
	else
	begin
	
		if ( Signal == MULTU )
		begin
		  if (temp[0] == 1'b1 )
			begin
				temp[63:32]  = temp[63:32] + dataA;
				temp[63:0]  = temp[63:0] >> 1 ;
				
			end
			
		 else
		   begin
			    temp[63:0]  = temp[63:0] >> 1 ;
		   end
		end
		

		
	end
	

end

assign dataOut = temp ;

endmodule
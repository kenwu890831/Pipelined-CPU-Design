`timescale 1ns/1ns
module HiLo( clk, MulAns, HiOut, LoOut, reset );
input clk ;
input reset ;
input [63:0] MulAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg [63:0] HiLo ;
reg [31:0] HiOut ;
reg [31:0] LoOut ;

/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

always@( posedge clk or reset or MulAns)
begin
  if ( reset )
  begin
    HiLo <= 64'b0 ;
  end

/*
reset訊號 如果是reset就做歸0
*/

  else
  begin
    HiLo = MulAns ;
	HiOut = MulAns[63:32] ;
	LoOut = MulAns[31:0] ; // 乘積	
  end
  

end

/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule
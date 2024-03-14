/*
	Title: 32-Bit Register with Synchronous Reset
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. clk
		2. rst: 重置訊號
		3. en_reg: 控制暫存器是否可寫入
		4. in_d: 欲寫入的暫存器資料
	Output Port
		1. out_d: 所讀取的暫存器資料
*/
module reg32 ( clk, rst, en_reg, in_d, out_d );
    input clk, rst, en_reg;
    input[31:0]	in_d;
    output[31:0] out_d;
    reg [31:0] out_d;
   
    always @( posedge clk ) begin
        if ( rst )
			out_d <= 32'b0;
        else if ( en_reg )
			out_d <= in_d;
    end

endmodule
	

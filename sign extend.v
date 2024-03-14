/*
	Title: Sign Extend
	Author: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. immein_d: Ū�J����sign extend���
	Output Port
		1. ext_immeout_d: ��X�w����sign extend���
*/
module sign_extend( immein_d, ext_immeout_d );

	input[15:0] immein_d;
	output[31:0] ext_immeout_d;
	assign ext_immeout_d = { {16{immein_d[15]}}, immein_d };
	
endmodule

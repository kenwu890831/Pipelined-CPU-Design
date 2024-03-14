
module alu(dataA, dataB, ctlSignal, result, zero);

	input [2:0] ctlSignal;
	input [31:0] dataA, dataB;
	output [31:0] result;
	output zero;

	wire bInvert;
	wire [31:0] carryIn, sum;

	assign bInvert = (ctlSignal == 3'b110)? 1'b1:(ctlSignal == 3'b111)? 1'b1:1'b0 ;
			   
	alu_oneBit bit0(.cout(carryIn[0]), .sum(sum[0]), .dataA(dataA[0]), .dataB(dataB[0]), .cin(bInvert), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit1(.cout(carryIn[1]), .sum(sum[1]), .dataA(dataA[1]), .dataB(dataB[1]), .cin(carryIn[0]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit2(.cout(carryIn[2]), .sum(sum[2]), .dataA(dataA[2]), .dataB(dataB[2]), .cin(carryIn[1]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit3(.cout(carryIn[3]), .sum(sum[3]), .dataA(dataA[3]), .dataB(dataB[3]), .cin(carryIn[2]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit4(.cout(carryIn[4]), .sum(sum[4]), .dataA(dataA[4]), .dataB(dataB[4]), .cin(carryIn[3]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit5(.cout(carryIn[5]), .sum(sum[5]), .dataA(dataA[5]), .dataB(dataB[5]), .cin(carryIn[4]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit6(.cout(carryIn[6]), .sum(sum[6]), .dataA(dataA[6]), .dataB(dataB[6]), .cin(carryIn[5]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit7(.cout(carryIn[7]), .sum(sum[7]), .dataA(dataA[7]), .dataB(dataB[7]), .cin(carryIn[6]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit8(.cout(carryIn[8]), .sum(sum[8]), .dataA(dataA[8]), .dataB(dataB[8]), .cin(carryIn[7]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit9(.cout(carryIn[9]), .sum(sum[9]), .dataA(dataA[9]), .dataB(dataB[9]), .cin(carryIn[8]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit10(.cout(carryIn[10]), .sum(sum[10]), .dataA(dataA[10]), .dataB(dataB[10]), .cin(carryIn[9]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit11(.cout(carryIn[11]), .sum(sum[11]), .dataA(dataA[11]), .dataB(dataB[11]), .cin(carryIn[10]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit12(.cout(carryIn[12]), .sum(sum[12]), .dataA(dataA[12]), .dataB(dataB[12]), .cin(carryIn[11]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit13(.cout(carryIn[13]), .sum(sum[13]), .dataA(dataA[13]), .dataB(dataB[13]), .cin(carryIn[12]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit14(.cout(carryIn[14]), .sum(sum[14]), .dataA(dataA[14]), .dataB(dataB[14]), .cin(carryIn[13]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit15(.cout(carryIn[15]), .sum(sum[15]), .dataA(dataA[15]), .dataB(dataB[15]), .cin(carryIn[14]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit16(.cout(carryIn[16]), .sum(sum[16]), .dataA(dataA[16]), .dataB(dataB[16]), .cin(carryIn[15]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit17(.cout(carryIn[17]), .sum(sum[17]), .dataA(dataA[17]), .dataB(dataB[17]), .cin(carryIn[16]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit18(.cout(carryIn[18]), .sum(sum[18]), .dataA(dataA[18]), .dataB(dataB[18]), .cin(carryIn[17]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit19(.cout(carryIn[19]), .sum(sum[19]), .dataA(dataA[19]), .dataB(dataB[19]), .cin(carryIn[18]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit20(.cout(carryIn[20]), .sum(sum[20]), .dataA(dataA[20]), .dataB(dataB[20]), .cin(carryIn[19]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit21(.cout(carryIn[21]), .sum(sum[21]), .dataA(dataA[21]), .dataB(dataB[21]), .cin(carryIn[20]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit22(.cout(carryIn[22]), .sum(sum[22]), .dataA(dataA[22]), .dataB(dataB[22]), .cin(carryIn[21]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit23(.cout(carryIn[23]), .sum(sum[23]), .dataA(dataA[23]), .dataB(dataB[23]), .cin(carryIn[22]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit24(.cout(carryIn[24]), .sum(sum[24]), .dataA(dataA[24]), .dataB(dataB[24]), .cin(carryIn[23]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit25(.cout(carryIn[25]), .sum(sum[25]), .dataA(dataA[25]), .dataB(dataB[25]), .cin(carryIn[24]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit26(.cout(carryIn[26]), .sum(sum[26]), .dataA(dataA[26]), .dataB(dataB[26]), .cin(carryIn[25]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit27(.cout(carryIn[27]), .sum(sum[27]), .dataA(dataA[27]), .dataB(dataB[27]), .cin(carryIn[26]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit28(.cout(carryIn[28]), .sum(sum[28]), .dataA(dataA[28]), .dataB(dataB[28]), .cin(carryIn[27]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit29(.cout(carryIn[29]), .sum(sum[29]), .dataA(dataA[29]), .dataB(dataB[29]), .cin(carryIn[28]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit30(.cout(carryIn[30]), .sum(sum[30]), .dataA(dataA[30]), .dataB(dataB[30]), .cin(carryIn[29]), .bInvert(bInvert), .ctlSignal(ctlSignal));
	alu_oneBit bit31(.cout(carryIn[31]), .sum(sum[31]), .dataA(dataA[31]), .dataB(dataB[31]), .cin(carryIn[30]), .bInvert(bInvert), .ctlSignal(ctlSignal));

	assign result = (ctlSignal == 3'b111) ? {31'b0, sum[31]} : sum;

	assign zero = (result == 32'b0) ? 1'b1 : 1'b0;
										 
endmodule
module alu_oneBit(cout, sum, dataA, dataB, cin, bInvert, ctlSignal);

	input dataA, dataB;
	input cin, bInvert;
	input [2:0] ctlSignal;
	output cout, sum;

	wire bi, s;
	wire _and, _or, _rca;

	and(_and, dataA, dataB);
	or(_or, dataA, dataB);
	xor(bi, dataB, bInvert);
	FullAdder tFullAdder(cout, s, dataA, bi, cin);

	assign sum = (ctlSignal == 3'b000)?_and : (ctlSignal == 3'b001)?_or : s ;

endmodule


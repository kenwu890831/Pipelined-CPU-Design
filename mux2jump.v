//-----------------------------------------------------------------------------
// Title         : 2-1 multiplexer
//-----------------------------------------------------------------------------

module mux2jump( sel, a, b, y );
    parameter bitwidth=32;
    input  [5:0] sel;
    input  [bitwidth-1:0] a, b;
    output [bitwidth-1:0] y;

    assign y = (sel== 6'b000011) ? b : a;
endmodule

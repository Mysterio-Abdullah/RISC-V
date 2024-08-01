module Mux(
        output logic [31:0] mux_out,
        input logic [31:0] mux_in_01,
        input logic [31:0] mux_in_02,
        input logic sel
        );

always_comb
    begin
        case(sel)
            1'b0: mux_out = mux_in_01;
            1'b1: mux_out = mux_in_02;
            default: mux_out = 32'bx;
        endcase    
    end
endmodule
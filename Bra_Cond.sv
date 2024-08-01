module Bra_Cond(
    output logic bra_taken,
    input logic [2:0] br_type,
    input logic [31:0] in_01, in_02,
    input logic [6:0] op_code
);

always_comb begin
    case (br_type)
        3'b000: bra_taken = ($signed(in_01) == $signed(in_02)) ? 1'b1 : 1'b0;
        3'b001: bra_taken = ($signed(in_01) != $signed(in_02)) ? 1'b1 : 1'b0;
        3'b010: bra_taken = ($signed(in_01) < $signed(in_02)) ? 1'b1 : 1'b0;
        3'b011: bra_taken = ($signed(in_01) >= $signed(in_02)) ? 1'b1 : 1'b0;
        3'b100: bra_taken = ($unsigned(in_01) < $unsigned(in_02)) ? 1'b1 : 1'b0;
        3'b101: bra_taken = ($unsigned(in_01) >= $unsigned(in_02)) ? 1'b1 : 1'b0;
        default: bra_taken = (op_code == 7'b1100111 || op_code == 7'b1101111) ? 1'b1 : 1'b0;
    endcase
end

endmodule

module Imm_gen(
                output logic signed [31:0] imm_value,
                input logic [11:0] I_imm_12, S_imm_12, B_imm_12, J2_imm_12,
                input logic [19:0] U_imm_20, J1_imm_20,
                input logic [6:0] opcode
              );

    always_comb
        begin
            case(opcode)
                7'b0010011: imm_value = $signed({{20{I_imm_12[11]}}, I_imm_12});
                7'b0000011: imm_value = $signed({{20{I_imm_12[11]}}, I_imm_12});
                7'b0100011: imm_value = $signed({{20{S_imm_12[11]}}, S_imm_12});
                7'b1100011: imm_value = $signed({{19{B_imm_12[11]}}, B_imm_12,1'b0});
                7'b0110111: imm_value = {U_imm_20, 12'b000000000000};
                7'b0010111: imm_value = {U_imm_20, 12'b000000000000};
                7'b1101111: imm_value = $signed({{11{J1_imm_20[19]}},J1_imm_20,1'b0});
                7'b1100111: imm_value = $signed({{19{J2_imm_12[11]}},J2_imm_12});
                default: imm_value = 32'bx;            
            endcase
        end
endmodule

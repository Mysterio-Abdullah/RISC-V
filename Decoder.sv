module Decoder(
                input logic [31:0] inst,                                            // 32 bits Instruction
                output logic [4:0] rd, rs1, rs2,                                    //  5 bits Register Addresses
                output logic [11:0] I_imm_12, S_imm_12, B_imm_12, J2_imm_12,         // 12 bits Immediates of I, S and B type 
                output logic [19:0] U_imm_20, J1_imm_20,                            // 20 bits Immediates of U and J type
                output logic [6:0] opcode,                                          //  7 bits Opcode
                output logic [2:0] func3,                                           //  3 bits Function_3
                output logic [6:0] func7                                            //  7 bits Function_7
                );

    always_comb
        begin
            rd = inst[11:7];                                                        // For R, I, U and J types
            rs1 = inst[19:15];                                                      // For R, I, S and B types
            rs2 = inst[24:20];                                                      // For R, S and B types
            I_imm_12 = inst[31:20];                                                 // For I type
            S_imm_12 = {inst[31:25],inst[11:7]};                                    // For S type
            B_imm_12 = {inst[31],inst[7],inst[30:25],inst[11:8]};                   // For B type
            U_imm_20 = inst[31:12];                                                 // For U type
            J1_imm_20 = {inst[31],inst[19:12],inst[20],inst[30:21]};                // For J type_01
            J2_imm_12 = inst[31:20];                
            func3 = inst[14:12];                                                    // For R, I, S and B type
            func7 = inst[31:25];                                                    // For R type     
            opcode = inst[6:0];                                                     // For all types
        end
endmodule

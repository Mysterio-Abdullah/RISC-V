module  Alu(
            output logic [31:0] result,         // Result will be fed back to Register/Memory file
            input logic [31:0] data_01,         // Data from rs1
            input logic [31:0] data_02,         // Data from rs2 or immediate one
            input [3:0] Alu_op                  // Decide the operation which has to be performed 
            );

always_comb
    begin   
        case (Alu_op)
            4'b0000: result = data_01 << data_02[4:0];                           // SLL
            4'b0001: result = data_01 >> data_02[4:0];                           // SRL
            4'b0010: result = ($signed(data_01)>>>data_02[4:0]);                 // SRA
            4'b0011: result = data_01  + data_02;                                // ADD
            4'b0100: result = data_01  - data_02;                                // SUB
            4'b0101: result = data_01  | data_02;                                // OR
            4'b0110: result = data_01  & data_02;                                // AND
            4'b0111: result = data_01  ^ data_02;                                // XOR
            4'b1000: result = ($signed(data_01)<$signed(data_02))?1:0;           // SLT
            4'b1001: result = ($unsigned(data_01)< $unsigned(data_02))?1:0;      // SLTU
            4'b1010: result = data_02;                                           // LUI 
        endcase
    end
endmodule


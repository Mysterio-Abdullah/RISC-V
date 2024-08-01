module Controller(
                  input logic [6:0] opcode,
                  input logic [2:0] func3, 
                  input logic [6:0] func7,
                  output logic [3:0] Alu_op,
                  output logic [2:0] b_type,
                  output logic write, sel, read, enable, wb_sel, select, mux_sel
                );

    always_comb
        begin
            if (opcode == 7'b0110011)                                               // R-Type
                begin
                            case({func7,func3})                                     
                                10'b0000000001 : begin  Alu_op = 4'b0000;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0000000101 : begin  Alu_op = 4'b0001;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0100000101 : begin  Alu_op = 4'b0010;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0000000000 : begin  Alu_op = 4'b0011;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0100000000 : begin  Alu_op = 4'b0100;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0000000110 : begin  Alu_op = 4'b0101;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0000000111 : begin  Alu_op = 4'b0110; 
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1; 
                                                        mux_sel = 1'b1; end
                                10'b0000000100 : begin  Alu_op = 4'b0111;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0000000010 : begin  Alu_op = 4'b1000;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                10'b0000000011 : begin  Alu_op = 4'b1001;
                                                        write = 1'b1;
                                                        sel = 1'b0;
                                                        wb_sel = 1'b0;
                                                        select = 1'b1;
                                                        mux_sel = 1'b1; end
                                default        : begin  Alu_op = 4'bxxxx;
                                                        write = 1'bx;
                                                        sel = 1'bx;
                                                        wb_sel = 1'bx;
                                                        select = 1'bx;
                                                        mux_sel = 1'bx; end
                
                            endcase
                end
                else if (opcode == 7'b0010011)                                      // I-Type 01
                    begin
                        case(func3)
                            3'b000: begin Alu_op = 4'b0011;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end    
                            3'b001: begin Alu_op = 4'b0000;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                            3'b010: begin Alu_op = 4'b1000;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                            3'b011: begin Alu_op = 4'b1001;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                            3'b100: begin Alu_op = 4'b0111;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                            3'b101: begin Alu_op = 4'b0001;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                            3'b110: begin Alu_op = 4'b0101;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                            3'b111: begin Alu_op = 4'b0110;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                            default:begin Alu_op = 4'b0010;
                                          write = 1'b1;
                                          sel = 1'b1;
                                          wb_sel = 1'b0;
                                          select = 1'b1;
                                          mux_sel = 1'b1; end
                        endcase
                    end
                else if (opcode == 7'b0000011)                                      // I-Type 02
                    begin
                        if (func3 == 3'b010)
                            begin
                                Alu_op = 4'b0011;
                                sel = 1'b1;
                                write = 1'b1;
                                read = 1'b1;
                                wb_sel = 1'b1;
                                select = 1'b1;
                                mux_sel = 1'b1;
                            end
                        else    
                            begin
                                Alu_op = 4'bxxxx;
                                sel = 1'bx;
                                write = 1'bx;
                                read = 1'bx;
                                wb_sel = 1'bx;
                                select = 1'bx;
                                mux_sel = 1'bx;
                            end
                    end
                else if (opcode == 7'b0100011)                                      // S-Type
                    begin
                        if (func3 == 3'b010)
                            begin
                                Alu_op = 4'b0011;
                                sel = 1'b1;
                                write = 1'b0;
                                read = 1'b0;
                                wb_sel = 1'bx;
                                enable = 1'b1;
                                select = 1'b1;
                            end
                        else    
                            begin
                                Alu_op = 4'bxxxx;
                                sel = 1'bx;
                                write = 1'bx;
                                read = 1'bx;
                                wb_sel = 1'bx;
                                enable = 1'bx;
                                select = 1'bx;
                            end
                    end
                else if (opcode == 7'b1100011)                                      // B-Type
                    begin   
                        case(func3)
                            3'b000 : begin  select = 1'b0;                          // BEQ
                                            b_type = 3'b000;
                                            sel = 1'b1;
                                            mux_sel = 1'b1;
                                            Alu_op = 4'b0011; end
                            3'b001 : begin  select = 1'b0;                          // BNE
                                            b_type = 3'b001;
                                            sel = 1'b1;
                                            mux_sel = 1'b1;
                                            Alu_op = 4'b0011; end
                            3'b100 : begin  select = 1'b0;                          // BLT
                                            b_type = 3'b010;
                                            sel = 1'b1;
                                            mux_sel = 1'b1;
                                            Alu_op = 4'b0011; end                  
                            3'b101 : begin  select = 1'b0;                          // BGE
                                            b_type = 3'b011;
                                            sel = 1'b1;
                                            mux_sel = 1'b1;
                                            Alu_op = 4'b0011; end
                            3'b110 : begin  select = 1'b0;                          // BLTU
                                            b_type = 3'b100;
                                            sel = 1'b1;
                                            mux_sel = 1'b1;
                                            Alu_op = 4'b0011; end
                            3'b111 : begin  select = 1'b0;                          // BGEU
                                            b_type = 3'b101;
                                            sel = 1'b1;
                                            mux_sel = 1'b1;
                                            Alu_op = 4'b0011; end
                            default: begin  select = 1'bx;                        
                                            b_type = 3'bxxx;
                                            sel = 1'bx;
                                            mux_sel = 1'bx;
                                            Alu_op = 4'bxxxx; end
                        endcase
                    end       
                else if (opcode == 7'b0110111)                                      // U-Type 01
                    begin
                        write = 1'b1;
                        sel = 1'b1;
                        wb_sel = 1'b0;
                        select = 1'bx;
                        Alu_op = 4'b1010;
                        mux_sel = 1'b1;
                    end
                else if (opcode == 7'b0010111)                                      // U-Type 02
                    begin
                        write = 1'b1;
                        sel = 1'b1;
                        wb_sel = 1'b0;
                        select = 1'b0;
                        Alu_op = 4'b0011;
                        mux_sel = 1'b1;                       
                    end
                else if (opcode == 7'b1101111)                                      // J-Type 01
                    begin
                        write = 1'b1;
                        select = 1'b0;
                        sel = 1'b1;
                        Alu_op = 4'b0011;
                        wb_sel = 1'bx;
                        mux_sel = 1'b0;
                    end  
                else if (opcode == 7'b1100111)                                      // J-Type 02
                    begin
                        write = 1'b1;
                        select = 1'b1;
                        sel = 1'b1;
                        Alu_op = 4'b0011;
                        wb_sel = 1'bx;
                        mux_sel = 1'b0;
                    end  

    end
                        
                        
                        
endmodule            
                        
                        
                        
                        
                        





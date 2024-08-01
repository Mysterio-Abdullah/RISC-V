module Riscv(
            input clock, reset, 
            output logic [31:0] data 
            );
    logic [31:0] PC,Jump;                                               // Between PC & Instruction Memory
    logic [31:0] Inst_32_bits;                                          // Between Instruction Memory & Decoder 
    logic [4:0] rd, rs1, rs2;                 
    logic [11:0] I_imm_12, S_imm_12, B_imm_12, J2_imm_12;               // Between Decoder & Imm_Generator  
    logic [19:0] U_imm_20, J1_imm_20;                                   // Between Decoder & Imm_Generator  
    logic [6:0] opcode;                       
    logic [2:0] func3;                        
    logic [6:0] func7; 
    logic [31:0] data_01;                               // Data from source register rs1
    logic [31:0] data_02;                               // Data from source register rs2
    logic [31:0] data_04;                               // Data to be fed back
    logic write,sel,enable,wb_sel,read,select,mux_sel;  // Signal comes from controller
    logic [3:0] Alu_op;                                 // Signal comes from controller
    logic [31:0] imm_value;                             // Immediate Value
    logic [31:0] mux_out;                               // Immediate or rs2 data
    logic [31:0] mem_data;                              // Data from the memory
    logic [31:0] mem_addr;                              // Memory address as an Alu output
    logic [31:0] data_05;                               // Memory data or Alu 
    logic [31:0] mux_res;                               // Address or data from rs1
    logic [2:0]  bra_type;                              // Branch Type
    logic bra_taken;                                    // Branch Taken
    logic [31:0] mux_result;


// Instances of Designed Modules

Pc Program_Counter(.pc_out(PC),.pc_in(Jump),.clk(clock),.reset(reset));
Inst_Mem Instructions(.address(PC),.inst_32_bits(Inst_32_bits));
Decoder Inst_Decoder(.inst(Inst_32_bits),.rd(rd),.rs1(rs1),.rs2(rs2),.I_imm_12(I_imm_12),.S_imm_12(S_imm_12),.B_imm_12(B_imm_12),.J2_imm_12(J2_imm_12),.U_imm_20(U_imm_20),.J1_imm_20(J1_imm_20),.opcode(opcode),.func3(func3),.func7(func7));
Reg_File Registers(.data_01(data_01),.data_02(data_02),.data_03(mux_result),.reg_addr_01(rs1),.reg_addr_02(rs2),.wr_addr_03(rd),.clock(clock),.reset(reset),.write(write));
Alu Operator(.result(data_04),.data_01(mux_res),.data_02(mux_out),.Alu_op(Alu_op));
Controller Control_Unit(.opcode(opcode),.func3(func3),.func7(func7),.Alu_op(Alu_op),.b_type(bra_type),.write(write),.sel(sel),.read(read),.enable(enable),.wb_sel(wb_sel),.select(select),.mux_sel(mux_sel));
Imm_gen Immediate_Generator(.imm_value(imm_value),.I_imm_12(I_imm_12),.S_imm_12(S_imm_12),.B_imm_12(B_imm_12),.J2_imm_12(J2_imm_12),.U_imm_20(U_imm_20),.J1_imm_20(J1_imm_20),.opcode(opcode));
Mux Alpha(.mux_out(mux_out),.mux_in_01(data_02),.mux_in_02(imm_value),.sel(sel));
Mem_File Memory(.mem_data(mem_data),.wr_data(data_02),.mem_addr(data_04),.write(enable),.read(read),.reset(reset),.clock(clock));
Mux Beta(.mux_out(data_05),.mux_in_01(data_04),.mux_in_02(mem_data),.sel(wb_sel));
Mux Bravo(.mux_out(mux_res),.mux_in_01(PC),.mux_in_02(data_01),.sel(select));
Bra_Cond Branch_Condition(.bra_taken(bra_taken),.br_type(bra_type),.in_01(data_01),.in_02(data_02),.op_code(opcode));
Mux Charlie(.mux_out(Jump),.mux_in_01(PC+4),.mux_in_02(data_04),.sel(bra_taken));
Mux Gamma(.mux_out(mux_result),.mux_in_01(PC+4),.mux_in_02(data_05),.sel(mux_sel));

    
endmodule

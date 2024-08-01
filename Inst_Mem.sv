module Inst_Mem(
    input logic [31:0] address,
    output logic [31:0] inst_32_bits
);

    reg [31:0] inst_mem [1023:0];
    
    initial begin
        
        $readmemh("/home/abdullah/Meds/Riscv-ISA/(File_Name)", inst_mem);
    end

    always_comb
    begin
        inst_32_bits = inst_mem[address>>2];
    end

endmodule

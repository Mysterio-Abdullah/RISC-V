module Reg_File(
                output logic [31:0] data_01,
                output logic [31:0] data_02,
                input logic [31:0] data_03,             // Data to be write in Register file
                input logic [4:0] reg_addr_01,          // Address of source register i.e rs1
                input logic [4:0] reg_addr_02,          // Address of source register i.e rs2
                input logic [4:0] wr_addr_03,           // Address where data is to be write i.e. rd
                input clock, reset, write
                );

    logic [31:0] reg_file [31:0];
initial begin
        reg_file[0] = 0;
        reg_file[31] = 32;
        reg_file[30] = 32;
        reg_file[29] = 3;
        end
   
    // Asychronous Read
    assign data_01 = reg_file[reg_addr_01];
    assign data_02 = reg_file[reg_addr_02];


    // Sychronous Write
    always @(negedge clock or posedge reset)
        begin
            if (reset)
            begin
                reg_file <= '{default: 32'h0};
            end
            else if (write)
            begin
                reg_file[wr_addr_03] <= data_03;
                reg_file[0] <= 0;
            end
        end
endmodule



































































































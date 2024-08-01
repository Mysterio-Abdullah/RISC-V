module Mem_File(
                output logic [31:0] mem_data,
                input logic [31:0] wr_data,
                input logic [31:0] mem_addr,
                input write, read, reset, clock 
                );

        logic [31:0] mem_file [31:0];
        initial
            begin
                mem_file[0] = 381;
            end
        always_comb 
            begin
                if (read)
                    begin
                    mem_data = mem_file[mem_addr];
                    end
            end
        always @(negedge clock or posedge reset)
        begin
            if (reset)
            begin
                mem_file <= '{default: 32'h0};
            end
        else if (write)
                begin
                    mem_file[mem_addr] <= wr_data;
                end
        end
        
        
endmodule 
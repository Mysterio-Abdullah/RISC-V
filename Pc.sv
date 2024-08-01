module Pc(
        output logic [31:0] pc_out,
        input logic [31:0] pc_in,
        input clk, reset
        );
    logic start = 1'b0;
always @(posedge clk or posedge reset) begin
    if (reset)
        begin
            pc_out <= 0;
        end
    else
        begin 
            if (start == 1'b0)
                begin  
                    pc_out <= 32'b0;
                    start <= 1'b1; 
                end
            else
                begin
                    pc_out <= pc_in;
                end
        end 
end

endmodule

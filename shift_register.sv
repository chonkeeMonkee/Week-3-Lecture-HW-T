module shift_register 
    #(parameter DIRECTION) ( 
    input clk,
    input rst, 
    input data, 
    input wr_en,
    output reg [31:0] out
); 


    always @ (posedge clk)
        begin
            // Reset to zero case
            if (rst) begin
                out <= 0; 
            end else begin
                // shifting only when wr_en = 1'b1
                if (wr_en) begin
                    // MSB Case - shift data right
                    if (DIRECTION) begin 
                        out <= out >> 1;
                        out[31] <= data; 
                    end else begin // LSB CASE - shift data left 
                        out <= out << 1;
                        out [0] <= data;
                    end 
                end
            end

        end 
    endmodule
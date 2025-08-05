module calculator (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [1:0] op,
    output reg  [7:0] result,
    output reg  error
);

    always @(*) begin
        error = 0;
        case (op)
            2'b00: result = a + b;       
            2'b01: result = a - b;     
            2'b10: result = a * b;       
            2'b11: begin                 
                if (b == 0) begin
                    error  = 1;
                    result = 8'b0;
                end else begin
                    result = a / b;
                end
            end
            default: result = 8'b0;
        endcase
    end
endmodule

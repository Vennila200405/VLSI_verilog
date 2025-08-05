module stack #(parameter DEPTH = 8, WIDTH = 8) (
    input wire clk,
    input wire rst,
    input wire push,
    input wire pop,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output reg full,
    output reg empty
);

    reg [WIDTH-1:0] stack_mem [0:DEPTH-1];
  reg [$clog2(DEPTH):0] sp;
        if (rst) begin
            sp <= 0;
            full <= 0;
            empty <= 1;
            data_out <= 0;
        end else begin
            case ({push, pop})
                2'b10: begin
                    if (!full) begin
                        stack_mem[sp] <= data_in;
                        sp <= sp + 1;
                    end
                end
                2'b01: begin 
                    if (!empty) begin
                        sp <= sp - 1;
                        data_out <= stack_mem[sp - 1];
                    end
                end
                default: ;
            endcase

            
            full <= (sp == DEPTH);
            empty <= (sp == 0);
        end
    end

endmodule

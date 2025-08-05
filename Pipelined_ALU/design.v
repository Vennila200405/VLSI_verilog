module pipelined_alu (
    input  wire clk,
    input  wire rst,
  input  wire [1:0] opcode,   
  input  wire [7:0] operand_a, 
  input  wire [7:0] operand_b, 
  output reg  [7:0] result   
  ;

  
  reg [1:0] opcode_reg;
    reg [7:0] operand_a_reg, operand_b_reg;

  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            opcode_reg    <= 0;
            operand_a_reg <= 0;
            operand_b_reg <= 0;
        end else begin
            opcode_reg    <= opcode;
            operand_a_reg <= operand_a;
            operand_b_reg <= operand_b;
        end
    end

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 0;
        end else begin
            case (opcode_reg)
                2'b00: result <= operand_a_reg + operand_b_reg;
                2'b01: result <= operand_a_reg - operand_b_reg;
                2'b10: result <= operand_a_reg & operand_b_reg;
                2'b11: result <= operand_a_reg | operand_b_reg;
                default: result <= 8'b00000000;
            endcase
        end
    end

endmodule

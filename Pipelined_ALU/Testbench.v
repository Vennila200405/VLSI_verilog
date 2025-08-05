module tb_pipelined_alu;
    reg clk, rst;
    reg [1:0] opcode;
    reg [7:0] operand_a, operand_b;
    wire [7:0] result;

    pipelined_alu uut (
        .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result)
    );

   
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10;
        rst = 0;

             
        opcode = 2'b00; operand_a = 8'd5; operand_b = 8'd3;
        #10;

      
        opcode = 2'b01; operand_a = 8'd10; operand_b = 8'd7;
        #10;

      
        opcode = 2'b10; operand_a = 8'd12; operand_b = 8'd5;
        #10;

        
        opcode = 2'b11; operand_a = 8'd9; operand_b = 8'd6;
        #10;

      
      repeat(10) begin
            #10;
            $display("Time=%0t Result=%d", $time, result);
        end

        $stop;
    end
endmodule

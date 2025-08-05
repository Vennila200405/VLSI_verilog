module tb_calculator;
    reg [3:0] a, b;
    reg [1:0] op;
    wire [7:0] result;
    wire error;

    calculator uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .error(error)
    );

    initial begin
        // Test Case 1: Addition (5 + 3)
        a = 4'd5; b = 4'd3; op = 2'b00;
        #10;
        $display("Addition: %d + %d = %d", a, b, result);

        // Test Case 2: Subtraction (9 - 4)
        a = 4'd9; b = 4'd4; op = 2'b01;
        #10;
        $display("Subtraction: %d - %d = %d", a, b, result);

        // Test Case 3: Multiplication (7 * 2)
        a = 4'd7; b = 4'd2; op = 2'b10;
        #10;
        $display("Multiplication: %d * %d = %d", a, b, result);

        // Test Case 4: Division (8 / 2)
        a = 4'd8; b = 4'd2; op = 2'b11;
        #10;
        $display("Division: %d / %d = %d", a, b, result);

        // Test Case 5: Division by Zero (8 / 0)
        a = 4'd8; b = 4'd0; op = 2'b11;
        #10;
        $display("Division by Zero: Error = %b", error);

        $stop;
    end
endmodule

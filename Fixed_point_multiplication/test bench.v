module tb_fixed_point_multiplier;
    reg [7:0] a, b;
    wire [7:0] result;

    fixed_point_multiplier uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Example: Multiply 3.5 * 2.25 (Q4.4 format)
        // 3.5 in Q4.4 = 3.5 * 16 = 56 (8'b00111000)
        // 2.25 in Q4.4 = 2.25 * 16 = 36 (8'b00100100)
        a = 8'b00111000; // 3.5
        b = 8'b00100100; // 2.25
        #10;
        $display("A = %f, B = %f, A*B = %f", a/16.0, b/16.0, result/16.0);

        // Multiply 1.5 * 1.5
        a = 8'b00011000; // 1.5
        b = 8'b00011000; // 1.5
        #10;
        $display("A = %f, B = %f, A*B = %f", a/16.0, b/16.0, result/16.0);

        $stop;
    end
endmodule

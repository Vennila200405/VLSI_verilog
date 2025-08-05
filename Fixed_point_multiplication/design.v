module fixed_point_multiplier (
    input  wire [7:0] a,   // Q4.4 fixed-point number
    input  wire [7:0] b,   // Q4.4 fixed-point number
    output wire [7:0] result // Q4.4 result
);
    wire [15:0] mult_result;

    assign mult_result = a * b;
    assign result = mult_result[11:4]; // Adjust to Q4.4 by right-shifting 4 bits
endmodule

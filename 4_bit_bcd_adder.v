module bcd_adder_dataflow (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] SUM,
    output       Cout
);
    wire [4:0] temp_sum;
    wire       correction_needed;
    wire [4:0] corrected_sum;

   
    assign temp_sum = A + B + Cin;

    
    assign correction_needed = (temp_sum > 9);
    assign corrected_sum = correction_needed ? (temp_sum + 5'd6) : temp_sum
    assign SUM  = corrected_sum[3:0];
    assign Cout = corrected_sum[4];
endmodule

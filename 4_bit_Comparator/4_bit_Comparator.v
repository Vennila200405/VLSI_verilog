module comparator_2bit (
    input  [1:0] A,
    input  [1:0] B,
    output       lt, eq, gt
);
    assign lt = (A < B);
    assign eq = (A == B);
    assign gt = (A > B);
endmodule

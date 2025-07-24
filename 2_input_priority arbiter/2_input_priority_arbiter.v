module priority_arbiter_dataflow (
    input wire req0,
    input wire req1,
    output wire grant0,
    output wire grant1
);


assign grant0 = req0;


assign grant1 = ~req0 & req1;

endmodule

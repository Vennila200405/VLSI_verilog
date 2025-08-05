module tb_stack;

    reg clk, rst, push, pop;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

  
    stack uut (
        .clk(clk),
        .rst(rst),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

  
    always #5 clk = ~clk;

    initial begin
        $monitor("Time: %0d | Push: %b | Pop: %b | Data In: %h | Data Out: %h | SP Full: %b | SP Empty: %b", 
                  $time, push, pop, data_in, data_out, full, empty);
    end

    initial begin
     
        clk = 0;
        rst = 1;
        push = 0;
        pop = 0;
        data_in = 8'h00;

    
        #10 rst = 0;

    
        #10 data_in = 8'hAA; push = 1; pop = 0;
        #10 push = 0;
        #10 data_in = 8'hBB; push = 1;
        #10 push = 0;
        #10 data_in = 8'hCC; push = 1;
        #10 push = 0;

        // Pop elements
        #10 pop = 1;
        #10 pop = 0;
        #10 pop = 1;
        #10 pop = 0;
        #10 pop = 1;
        #10 pop = 0;

       
        #20 $finish;
    end

endmodule

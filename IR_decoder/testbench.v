module tb_ir_decoder;
    reg clk;
    reg reset;
    reg ir_signal;
    wire [31:0] data_out;
    wire data_valid;

    ir_decoder uut (
        .clk(clk),
        .reset(reset),
        .ir_signal(ir_signal),
        .data_out(data_out),
        .data_valid(data_valid)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    task send_bit(input bit_value);
        begin
            ir_signal = 1'b0; 
          #560;                  
          #1690;           
    endtask

    initial begin
        reset = 1;
        ir_signal = 1;
        #100;
        reset = 0;

        
        #9000;
        ir_signal = 1;
        #4500; 

        send_bit(1); send_bit(0); send_bit(1); send_bit(0);
        send_bit(1); send_bit(0); send_bit(1); send_bit(0);

        send_bit(0); send_bit(1); send_bit(0); send_bit(1);
        send_bit(0); send_bit(1); send_bit(0); send_bit(1);

        send_bit(1); send_bit(1); send_bit(0); send_bit(0);
        send_bit(1); send_bit(1); send_bit(0); send_bit(0);

        send_bit(0); send_bit(0); send_bit(1); send_bit(1);
        send_bit(0); send_bit(0); send_bit(1); send_bit(1);

       
        ir_signal = 1;

        #10000; 
        $display("Decoded Data: %h", data_out);
        $stop;
    end
endmodule

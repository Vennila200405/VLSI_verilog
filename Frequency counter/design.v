module frequency_counter (
    input  wire clk,        
    input  wire reset,       
    input  wire signal_in,   
  output reg  [31:0] frequency_count  

  parameter GATE_TIME = 100000000;  
    reg [31:0] pulse_counter;
    reg gate_enable;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            gate_counter    <= 0;
            pulse_counter   <= 0;
            frequency_count <= 0;
            gate_enable     <= 1;
        end else begin
            if (gate_enable) begin
                gate_counter <= gate_counter + 1;

               
                if (signal_in)
                    pulse_counter <= pulse_counter + 1;

               
                if (gate_counter >= GATE_TIME) begin
                    frequency_count <= pulse_counter;
                    gate_counter    <= 0;
                    pulse_counter   <= 0;
                end
            end
        end
    end

endmodule

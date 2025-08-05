module traffic_light_controller (
    input  wire clk,
    input  wire rst,
    input  wire [7:0] command,
    input  wire command_valid,
    output reg red_light,
    output reg yellow_light,
    output reg green_light
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            red_light    <= 0;
            yellow_light <= 0;
            green_light  <= 0;
        end else if (command_valid) begin
            case (command)
                "R": begin
                    red_light    <= 1;
                    yellow_light <= 0;
                    green_light  <= 0;
                end
                "Y": begin
                    red_light    <= 0;
                    yellow_light <= 1;
                    green_light  <= 0;
                end
                "G": begin
                    red_light    <= 0;
                    yellow_light <= 0;
                    green_light  <= 1;
                end
                default: begin
                    // No action for invalid command
                end
            endcase
        end
    end
endmodule

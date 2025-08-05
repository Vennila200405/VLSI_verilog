module login_system (
    input  wire clk,
    input  wire rst,
    input  wire [7:0] rx_data,
    input  wire rx_data_valid,
    output reg  login_success,
    output reg  login_fail
);
    parameter USERNAME = "user";
    parameter PASSWORD = "pass";

    reg [7:0] username_mem [0:3] = { "u", "s", "e", "r" };
    reg [7:0] password_mem [0:3] = { "p", "a", "s", "s" };

    reg [2:0] state = 0;
    reg [1:0] index = 0;
    reg match_flag = 1;

    localparam IDLE = 0, CHECK_USERNAME = 1, CHECK_PASSWORD = 2, SUCCESS = 3, FAIL = 4;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state         <= IDLE;
            index         <= 0;
            login_success <= 0;
            login_fail    <= 0;
            match_flag    <= 1;
        end else begin
            case (state)
                IDLE: begin
                    login_success <= 0;
                    login_fail    <= 0;
                    index         <= 0;
                    match_flag    <= 1;
                    if (rx_data_valid)
                        state <= CHECK_USERNAME;
                end
                CHECK_USERNAME: begin
                    if (rx_data_valid) begin
                        if (rx_data != username_mem[index])
                            match_flag <= 0;
                        index <= index + 1;
                        if (index == 3)
                            state <= (match_flag ? CHECK_PASSWORD : FAIL);
                    end
                end
                CHECK_PASSWORD: begin
                    if (rx_data_valid) begin
                        if (rx_data != password_mem[index - 4])
                            match_flag <= 0;
                        index <= index + 1;
                        if (index == 7)
                            state <= (match_flag ? SUCCESS : FAIL);
                    end
                end
                SUCCESS: begin
                    login_success <= 1;
                    state <= IDLE;
                end
                FAIL: begin
                    login_fail <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule

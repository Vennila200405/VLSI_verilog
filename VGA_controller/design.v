module vga_controller (
    input  wire clk,  
    input  wire rst,
    output reg  hsync,
    output reg  vsync,
    output reg  [9:0] hcount,
    output reg  [9:0] vcount,
    output wire video_on
);

    
    always @(posedge clk or posedge rst) begin
        if (rst)
            hcount <= 0;
        else if (hcount == 799)
            hcount <= 0;
        else
            hcount <= hcount + 1;
    end

  
    always @(posedge clk or posedge rst) begin
        if (rst)
            vcount <= 0;
        else if (hcount == 799) begin
            if (vcount == 524)
                vcount <= 0;
            else
                vcount <= vcount + 1;
        end
    end

   
    always @(posedge clk) begin
        hsync <= ~(hcount >= 656 && hcount < 752);
    end

    
    always @(posedge clk) begin
        vsync <= ~(vcount >= 490 && vcount < 492);
    end

   
    assign video_on = (hcount < 640) && (vcount < 480);

endmodule

module clock_divider #(parameter CLK_HZ = 100_000_000)(
    input  wire clk,
    input  wire rst_n,
    output reg  tick_1khz,
    output reg  tick_1hz
);
    localparam DIV_1KHZ = CLK_HZ/1000;   // 100_000
    localparam DIV_1HZ  = CLK_HZ;        // 100_000_000

    reg [26:0] c1k, c1s;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin c1k<=0; c1s<=0; tick_1khz<=0; tick_1hz<=0; end
        else begin
            /* 1 kHz */
            if(c1k == DIV_1KHZ-1) begin c1k<=0; tick_1khz<=1; end
            else                   begin c1k<=c1k+1; tick_1khz<=0; end
            /* 1 Hz  */
            if(c1s == DIV_1HZ-1)  begin c1s<=0; tick_1hz<=1;  end
            else                   begin c1s<=c1s+1; tick_1hz<=0; end
        end
    end
endmodule

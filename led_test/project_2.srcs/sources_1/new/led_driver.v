module led_driver(
    input  [3:0] sec0, sec1,          // BCD
    output [15:0] led                 // High = ON
);
    wire [7:0] s_bin = {4'b0,sec1} * 8'd10 + {4'b0,sec0};
    assign led = s_bin;               // 하위 6 bit 사용
endmodule

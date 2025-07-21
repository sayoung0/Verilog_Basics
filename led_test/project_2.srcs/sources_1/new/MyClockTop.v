// ───────────────────────────────
//  Top:  MM:SS  →  16 LED (이진)
//        7-세그 회로 제거
// ───────────────────────────────
module MyClockTop_LED (
    input  wire clk,        // 100 MHz (R4)
    input  wire rst_n,      // Reset, active-Low (SW23)
    output wire [15:0] led  // 16 LEDs, High = ON
);
    /* 1 k / 1 Hz 분주 (1 kHz는 사용하지 않아도 OK) */
    wire tick_1khz_unused, tick_1hz;
    clock_divider #(.CLK_HZ(100_000_000)) u_div (
        .clk       (clk),
        .rst_n     (rst_n),
        .tick_1khz (tick_1khz_unused),
        .tick_1hz  (tick_1hz)
    );

    /* MM:SS BCD 카운터 (1 Hz) */
    wire [3:0] s0, s1, m0, m1;
    time_counter u_time (
        .clk   (tick_1hz),
        .rst_n (rst_n),
        .sec0  (s0), .sec1 (s1),
        .min0  (m0), .min1 (m1)
    );

    /* LED = 초(0-59) 2진수 표시 */
    led_driver u_led (
        .sec0 (s0),
        .sec1 (s1),
        .led  (led)
    );
endmodule

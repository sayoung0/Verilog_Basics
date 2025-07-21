// Top-level: MM:SS → LED(16) + 7-Seg(4)  / Board: FSK-III
module TimeDisplayTop(
    input  wire clk,        // 100 MHz
    input  wire rst_n,      // Reset switch (Low = reset)
    output wire [15:0] led, // 16 LEDs  (High = ON)
    output wire [6:0] seg,  // Segments (High = ON)
    output wire [3:0] an    // Digit EN (High = ON)
);
    /* ── 1 kHz / 1 Hz ─────────────────────────────── */
    wire tick_1khz, tick_1hz;
    clock_divider #(.CLK_HZ(100_000_000)) u_div (
        .clk       (clk),
        .rst_n     (rst_n),
        .tick_1khz (tick_1khz),
        .tick_1hz  (tick_1hz)
    );

    /* ── BCD Time Counter (00:00-59:59) ──────────── */
    wire [3:0] s0, s1, m0, m1;
    time_counter u_time (
        .clk   (tick_1hz),
        .rst_n (rst_n),
        .sec0  (s0), .sec1 (s1),
        .min0  (m0), .min1 (m1)
    );

    /* ── LED: 초를 2진수로 ────────────────────────── */
    led_driver u_led (.sec0(s0), .sec1(s1), .led(led));

    /* ── 7-Segment: MM:SS (active-High) ──────────── */
    fnd_driver_activeH u_fnd (
        .clk_1khz (tick_1khz),
        .d0(s0), .d1(s1), .d2(m0), .d3(m1),
        .seg(seg), .an(an)
    );
endmodule

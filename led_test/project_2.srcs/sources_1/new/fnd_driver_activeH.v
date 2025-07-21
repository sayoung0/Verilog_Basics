module fnd_driver_activeH(
    input        clk_1khz,
    input  [3:0] d0,d1,d2,d3,
    output reg [6:0] seg,   // High = ON (gfedcba)
    output reg [3:0] an     // High = ON
);
    reg [1:0] scan;
    always @(posedge clk_1khz) scan <= scan + 1'b1;

    function [6:0] seg_of;
        input [3:0] b; begin
            case(b)   // g f e d c b a
                0: seg_of=7'b0111111; 1: seg_of=7'b0000110;
                2: seg_of=7'b1011011; 3: seg_of=7'b1001111;
                4: seg_of=7'b1100110; 5: seg_of=7'b1101101;
                6: seg_of=7'b1111101; 7: seg_of=7'b0000111;
                8: seg_of=7'b1111111; 9: seg_of=7'b1101111;
                default: seg_of=7'b0000000;
            endcase
        end
    endfunction

    always @(*) begin
        case(scan)
            2'd0: begin an=4'b0001; seg=seg_of(d0); end // LSB
            2'd1: begin an=4'b0010; seg=seg_of(d1); end
            2'd2: begin an=4'b0100; seg=seg_of(d2); end
            2'd3: begin an=4'b1000; seg=seg_of(d3); end // MSB
        endcase
    end
endmodule

module time_counter(
    input  wire clk,    // 1 Hz
    input  wire rst_n,
    output reg [3:0] sec0, sec1, min0, min1
);
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)          {min1,min0,sec1,sec0} <= 16'h0;
        else begin
            if(sec0==9) begin
                sec0<=0;
                if(sec1==5) begin
                    sec1<=0;
                    if(min0==9) begin
                        min0<=0;
                        if(min1==5) min1<=0;
                        else        min1<=min1+1;
                    end else       min0<=min0+1;
                end else       sec1<=sec1+1;
            end else sec0<=sec0+1;
        end
    end
endmodule

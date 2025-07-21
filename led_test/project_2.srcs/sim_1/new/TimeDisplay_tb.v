module TimeDisplay_tb;
    reg clk=0, rst_n=0;
    wire [15:0] led; wire [6:0] seg; wire [3:0] an;
    TimeDisplayTop dut(.clk(clk), .rst_n(rst_n), .led(led), .seg(seg), .an(an));
    always #5 clk = ~clk;           // 100 MHz
    initial begin
        #100 rst_n = 1;             // reset «ÿ¡¶
        #2000000 $finish;           // 2 ms (2 √ )
    end
endmodule

module testbench;

    reg [7:0] a_tb;
    reg [7:0] b_tb;
    reg cin_tb;

    wire [7:0] sum_tb;
    wire cout_tb;

    Adder_8b UUT (
        .a(a_tb),
        .b(b_tb),
        .cin(cin_tb),
        .sum(sum_tb),
        .cout(cout_tb)
    );

    initial begin
        $display("---------------------------------");
        $display("   8비트 가산기 시뮬레이션 시작   ");
        $display("---------------------------------");
        
        // 1. 초기값: 모든 입력 0
        a_tb = 8'h0; b_tb = 8'h0; cin_tb = 1'b0;
        #10; // 10ns 대기
        $display("Time=%0dns: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb);

        // 2. 간단한 덧셈: 5 + 3
        a_tb = 8'd5; b_tb = 8'd3; cin_tb = 1'b0;
        #10;
        $display("Time=%0dns: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb);

        // 3. 자리올림(carry-in)을 포함한 덧셈: 10 + 20 + 1
        a_tb = 8'd10; b_tb = 8'd20; cin_tb = 1'b1;
        #10;
        $display("Time=%0dns: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb);

        // 4. 최대값 덧셈: FF + 01 (16진수)
        a_tb = 8'hFF; b_tb = 8'h01; cin_tb = 1'b0;
        #10;
        $display("Time=%0dns: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb);

        // 5. 모든 비트가 1인 경우
        a_tb = 8'hFF; b_tb = 8'hFF; cin_tb = 1'b1;
        #10;
        $display("Time=%0dns: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb);

        $finish; // 시뮬레이션 종료
    end
endmodule
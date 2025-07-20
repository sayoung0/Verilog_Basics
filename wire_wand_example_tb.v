// wire_wand_example_tb.v

`timescale 1ns / 1ps // 시간 단위를 1나노초, 정밀도를 1피코초로 설정

module wire_wand_example_tb;

    reg tb_a, tb_b, tb_c;
    wire tb_w_nor, tb_w_buf, tb_w_wire, tb_w_wand;

    wand_ex UUT (
        .a(tb_a),
        .b(tb_b),
        .c(tb_c),
        .w_nor(tb_w_nor),
        .w_buf(tb_w_buf),
        .w_wire(tb_w_wire),
        .w_wand(tb_w_wand)
    );

    initial begin
        $dumpfile("wire_wand_example.vcd");
        $dumpvars(0, wire_wand_example_tb);

        // 초기 값 설정 (Time 0ns)
        tb_a = 1'b0;
        tb_b = 1'b0;
        tb_c = 1'b0;

        // 초기 값 출력 (Time 0ns 이후, 논리 전파를 위해 아주 작은 지연을 줍니다)
        #1; // 1ps 지연 (timescale에 의해) - 'ps' 단위 문자 제거
        $display("Time: %0t ps | a=%b, b=%b, c=%b | w_nor=%b, w_buf=%b, w_wire=%b, w_wand=%b",
                 $time, tb_a, tb_b, tb_c, tb_w_nor, tb_w_buf, tb_w_wire, tb_w_wand); // 'ns' 문자 제거하고 'ps'로 변경

        #49000000000; // 49ns 지연 (49 * 1,000,000,000 ps = 490억 ps) - 'ns' 단위 문자 제거

        // 50ns 시점에서 입력 변경
        tb_a = 1'b1;
        tb_b = 1'b1;
        
        // 변경된 후 값 출력 (50ns 이후, 논리 전파를 위해 아주 작은 지연을 줍니다)
        #1; // 1ps 지연 - 'ps' 단위 문자 제거
        $display("Time: %0t ps | a=%b, b=%b, c=%b | w_nor=%b, w_buf=%b, w_wire=%b, w_wand=%b",
                 $time, tb_a, tb_b, tb_c, tb_w_nor, tb_w_buf, tb_w_wire, tb_w_wand); // 'ns' 문자 제거하고 'ps'로 변경

        #54000000000; // 54ns 지연 (54 * 1,000,000,000 ps = 540억 ps)
                      // 총 시뮬레이션 시간 ~105ns (1ps + 49ns + 1ps + 54ns)
        $finish;
    end

endmodule
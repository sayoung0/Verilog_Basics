// wire_wand_example.v

module wand_ex (
    input a, // 'input reg' 대신 'input'만 사용 (SystemVerilog 오류 수정)
    input b,
    input c,
    output wire w_nor,
    output wire w_buf,
    output wire w_wire,
    output wand w_wand
);

    // --- (여기에 initial begin ... end 블록은 완전히 제거되어야 합니다!) ---

    // 게이트 연결
    nor (w_nor, a, b);
    buf (w_buf, c);

    nor (w_wire, a, b);
    buf (w_wire, c);

    nor (w_wand, a, b);
    buf (w_wand, c);

endmodule
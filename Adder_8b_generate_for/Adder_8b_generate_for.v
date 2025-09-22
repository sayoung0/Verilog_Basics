module Adder_8b_generate_for (input [7:0] a, input [7:0] b, input cin, output [7:0] sum, output cout);

    wire [7:0] c;
    
    full_adder U0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0])); //첫번째 비트
    
    parameter SIZE = 8;

    genvar  i;
    generate
        for(i=1; i<SIZE; i=i+1) begin :bit_adder
            full_adder Ubit(.a(a[i]), .b(b[i]), .cin(c[i-1]), .sum(sum[i]), .cout(c[i]));
        end
        endgenerate
        
        assign cout = c[7];
        
endmodule
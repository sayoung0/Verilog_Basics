module full_adder (input a, input b, input cin, output sum, output cout);
wire temp_sum, temp_c1, temp_c2;
    half_adder u0(.a(a), .b(b), .sum(temp_sum), .cout(temp_c1));
    half_adder u1(.a(temp_sum), .b(cin), .sum(sum), .cout(temp_c2));
    or u2 (cout, temp_c1, temp_c2);
endmodule

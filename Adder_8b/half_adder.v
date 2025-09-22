module half_adder (input a, input b, output sum, output cout);
    wire cout_bar;
    xor U0 (sum, a, b);
    nand U1(cout_bar, a, b);
    not U2 (cout, cout_bar);
    
 endmodule
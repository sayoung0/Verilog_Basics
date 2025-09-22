module Adder_8b_array(input [7:0] a, input [7:0] b, input cin, output [7:0] sum, output cout);

    full_adder U0 [7:0] (.in({a,b}), .out({sum, cout}), .en(cin)); 
endmodule
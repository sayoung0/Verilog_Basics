module debounce(clk, reset, sw1_in,sw1_out);
	input			clk;
	input			reset;
	input			sw1_in;
	output reg 	sw1_out;
	
	reg			tmp_sw1;
	
	always@(negedge reset, negedge clk) begin
		if	(!reset) begin
			sw1_out <= 1'b0; //Switch:Action Low, steady state:high
			tmp_sw1 <= 1'b0; //Switch:Action Low, steady state:high
		end else begin		  //falling edge
			tmp_sw1 <= sw1_in;
			sw1_out <= tmp_sw1;
		end
	end
endmodule

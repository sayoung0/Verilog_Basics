module Cnt_OneToSix( clk, reset, value);
		input		clk;
		input		reset;
		output reg	[2:0] value;
		
	always@(negedge reset, posedge clk) begin
		if(!reset)
			value <=1;
		else begin
			if (value ==6)
					value		<= 1;
			else
					value		<= value + 1;
			end
		end
	endmodule
	

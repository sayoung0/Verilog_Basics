module counter (reset, clk_in, q , clk_out);
	parameter integer cnt_value=60;
	input 	reset;
	input		clk_in;
	
	output reg [6:0] q;
	output reg  clk_out;
	
	always@(negedge reset, posedge clk_in) begin
		if (!reset) begin
			q			<= 0;
			clk_out 	<= 0;
		end else begin
	if (q == (cnt_value -1))begin
			q			<= 0;
			clk_out  <= 1'b1;
	end else begin
			q		   <= q+1;
			clk_out	<= 1'b0;
		end
	end
end
endmodule

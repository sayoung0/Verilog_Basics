module int2seg1 (int, seg);
		input 	[3:0] 	int;
		output reg [6:0] 	seg;
		
	always@(int) begin
		if (int == 0) seg <= 7'b100_0000; 	//gfedcba
		else if(int == 1)			seg <=7'b111_1001;
		else if(int == 2)			seg <=7'b010_0100;
		else if(int == 3)			seg <=7'b011_0000;
		else if(int == 4)			seg <=7'b001_1001;
		else if(int == 5)			seg <=7'b001_0010;
		else if(int == 6)			seg <=7'b000_0010;
		else if(int == 7)			seg <=7'b111_1000;
		else if(int == 8)			seg <=7'b000_0000;
		else				seg <=7'b001_1000;
	end
endmodule

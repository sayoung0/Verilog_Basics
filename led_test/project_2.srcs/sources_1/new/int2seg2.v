module int2seg2 (reset, int_value, seg_10, seg_01);
	input		 		reset;
	input		[6:0] int_value;
	output   [6:0] seg_10;
	output 	[6:0] seg_01;
	
	reg [3:0] 		dec_10;
	reg [3:0]      dec_01;
	
	always@(reset, int_value) begin
		if(reset == 1'b0) begin
			dec_10 	<=0;  
			dec_01  	<=0;
		end else if (int_value >= 90) begin
			dec_10  <=9;  dec_01 <= int_value - 90;
		
		end else if (int_value >= 80) begin
			dec_10  <=8;  dec_01 <= int_value - 80;
		
		end else if (int_value >= 70) begin
			dec_10  <=7;  dec_01 <= int_value - 70;
		
		end else if (int_value >= 60) begin
			dec_10  <=6;  dec_01 <= int_value - 60;
		
		end else if (int_value >= 50) begin
                dec_10  <=5;  dec_01 <= int_value - 50;
            
            end else if (int_value >= 40) begin
                dec_10  <=4;  dec_01 <= int_value - 40;
            
            end else if (int_value >= 30) begin
                dec_10  <=3;  dec_01 <= int_value - 30;
            
            end else if (int_value >= 20) begin
                dec_10  <=2;  dec_01 <= int_value - 20;
            
            end else if (int_value >= 10) begin
                dec_10  <=1;  dec_01 <= int_value - 10;
            
            end else begin 
                dec_10  <=0;  dec_01 <= int_value;
            end
        end
        
        int2seg1 seg_10_ten (.int(dec_10), .seg(seg_10));
        int2seg1 seg_01_one (.int(dec_01), .seg(seg_01));
    endmodule

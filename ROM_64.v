module ROM_64(
input clk,
input in_valid,
input rst_n,
output reg [23:0] w_r,
output reg [23:0] w_i,
output reg[1:0] state
);

reg valid,next_valid;
reg [7:0] count,next_count;
always @(*) begin
    if(in_valid || valid)next_count = count + 1;
    else next_count = count;
    
    if (count<8'd64) 
        state = 2'd0;
    else if (count >= 8'd64 && count < 8'd128)
        state = 2'd1;
    else if (count >= 8'd128 && count < 8'd192)
        state = 2'd2;
    else state = 2'd3;

	case(count)
	8'd128: begin 
	 w_r = 24'b 000000000000000100000000;
	 w_i = 24'b 000000000000000000000000;
	 next_valid = 1'b1;
	 end
	8'd129: begin 
	 w_r = 24'b 000000000000000100000000;
	 w_i = 24'b 111111111111111111110011;
	 next_valid = 1'b1;
	 end
	8'd130: begin 
	 w_r = 24'b 000000000000000011111111;
	 w_i = 24'b 111111111111111111100111;
	 next_valid = 1'b1;
	 end
	8'd131: begin 
	 w_r = 24'b 000000000000000011111101;
	 w_i = 24'b 111111111111111111011010;
	 next_valid = 1'b1;
	 end
	8'd132: begin 
	 w_r = 24'b 000000000000000011111011;
	 w_i = 24'b 111111111111111111001110;
	 next_valid = 1'b1;
	 end
	8'd133: begin 
	 w_r = 24'b 000000000000000011111000;
	 w_i = 24'b 111111111111111111000010;
	 next_valid = 1'b1;
	 end
	8'd134: begin 
	 w_r = 24'b 000000000000000011110101;
	 w_i = 24'b 111111111111111110110110;
	 next_valid = 1'b1;
	 end
	8'd135: begin 
	 w_r = 24'b 000000000000000011110001;
	 w_i = 24'b 111111111111111110101010;
	 next_valid = 1'b1;
	 end
	8'd136: begin 
	 w_r = 24'b 000000000000000011101101;
	 w_i = 24'b 111111111111111110011110;
	 next_valid = 1'b1;
	 end
	8'd137: begin 
	 w_r = 24'b 000000000000000011100111;
	 w_i = 24'b 111111111111111110010011;
	 next_valid = 1'b1;
	 end
	8'd138: begin 
	 w_r = 24'b 000000000000000011100010;
	 w_i = 24'b 111111111111111110000111;
	 next_valid = 1'b1;
	 end
	8'd139: begin 
	 w_r = 24'b 000000000000000011011100;
	 w_i = 24'b 111111111111111101111100;
	 next_valid = 1'b1;
	 end
	8'd140: begin 
	 w_r = 24'b 000000000000000011010101;
	 w_i = 24'b 111111111111111101110010;
	 next_valid = 1'b1;
	 end
	8'd141: begin 
	 w_r = 24'b 000000000000000011001110;
	 w_i = 24'b 111111111111111101101000;
	 next_valid = 1'b1;
	 end
	8'd142: begin 
	 w_r = 24'b 000000000000000011000110;
	 w_i = 24'b 111111111111111101011110;
	 next_valid = 1'b1;
	 end
	8'd143: begin 
	 w_r = 24'b 000000000000000010111110;
	 w_i = 24'b 111111111111111101010100;
	 next_valid = 1'b1;
	 end
	8'd144: begin 
	 w_r = 24'b 000000000000000010110101;
	 w_i = 24'b 111111111111111101001011;
	 next_valid = 1'b1;
	 end
	8'd145: begin 
	 w_r = 24'b 000000000000000010101100;
	 w_i = 24'b 111111111111111101000010;
	 next_valid = 1'b1;
	 end
	8'd146: begin 
	 w_r = 24'b 000000000000000010100010;
	 w_i = 24'b 111111111111111100111010;
	 next_valid = 1'b1;
	 end
	8'd147: begin 
	 w_r = 24'b 000000000000000010011000;
	 w_i = 24'b 111111111111111100110010;
	 next_valid = 1'b1;
	 end
	8'd148: begin 
	 w_r = 24'b 000000000000000010001110;
	 w_i = 24'b 111111111111111100101011;
	 next_valid = 1'b1;
	 end
	8'd149: begin 
	 w_r = 24'b 000000000000000010000100;
	 w_i = 24'b 111111111111111100100100;
	 next_valid = 1'b1;
	 end
	8'd150: begin 
	 w_r = 24'b 000000000000000001111001;
	 w_i = 24'b 111111111111111100011110;
	 next_valid = 1'b1;
	 end
	8'd151: begin 
	 w_r = 24'b 000000000000000001101101;
	 w_i = 24'b 111111111111111100011001;
	 next_valid = 1'b1;
	 end
	8'd152: begin 
	 w_r = 24'b 000000000000000001100010;
	 w_i = 24'b 111111111111111100010011;
	 next_valid = 1'b1;
	 end
	8'd153: begin 
	 w_r = 24'b 000000000000000001010110;
	 w_i = 24'b 111111111111111100001111;
	 next_valid = 1'b1;
	 end
	8'd154: begin 
	 w_r = 24'b 000000000000000001001010;
	 w_i = 24'b 111111111111111100001011;
	 next_valid = 1'b1;
	 end
	8'd155: begin 
	 w_r = 24'b 000000000000000000111110;
	 w_i = 24'b 111111111111111100001000;
	 next_valid = 1'b1;
	 end
	8'd156: begin 
	 w_r = 24'b 000000000000000000110010;
	 w_i = 24'b 111111111111111100000101;
	 next_valid = 1'b1;
	 end
	8'd157: begin 
	 w_r = 24'b 000000000000000000100110;
	 w_i = 24'b 111111111111111100000011;
	 next_valid = 1'b1;
	 end
	8'd158: begin 
	 w_r = 24'b 000000000000000000011001;
	 w_i = 24'b 111111111111111100000001;
	 next_valid = 1'b1;
	 end
	8'd159: begin 
	 w_r = 24'b 000000000000000000001101;
	 w_i = 24'b 111111111111111100000000;
	 next_valid = 1'b1;
	 end
	8'd160: begin 
	 w_r = 24'b 000000000000000000000000;
	 w_i = 24'b 111111111111111100000000;
	 next_valid = 1'b1;
	 end
	8'd161: begin 
	 w_r = 24'b 111111111111111111110011;
	 w_i = 24'b 111111111111111100000000;
	 next_valid = 1'b1;
	 end
	8'd162: begin 
	 w_r = 24'b 111111111111111111100111;
	 w_i = 24'b 111111111111111100000001;
	 next_valid = 1'b1;
	 end
	8'd163: begin 
	 w_r = 24'b 111111111111111111011010;
	 w_i = 24'b 111111111111111100000011;
	 next_valid = 1'b1;
	 end
	8'd164: begin 
	 w_r = 24'b 111111111111111111001110;
	 w_i = 24'b 111111111111111100000101;
	 next_valid = 1'b1;
	 end
	8'd165: begin 
	 w_r = 24'b 111111111111111111000010;
	 w_i = 24'b 111111111111111100001000;
	 next_valid = 1'b1;
	 end
	8'd166: begin 
	 w_r = 24'b 111111111111111110110110;
	 w_i = 24'b 111111111111111100001011;
	 next_valid = 1'b1;
	 end
	8'd167: begin 
	 w_r = 24'b 111111111111111110101010;
	 w_i = 24'b 111111111111111100001111;
	 next_valid = 1'b1;
	 end
	8'd168: begin 
	 w_r = 24'b 111111111111111110011110;
	 w_i = 24'b 111111111111111100010011;
	 next_valid = 1'b1;
	 end
	8'd169: begin 
	 w_r = 24'b 111111111111111110010011;
	 w_i = 24'b 111111111111111100011001;
	 next_valid = 1'b1;
	 end
	8'd170: begin 
	 w_r = 24'b 111111111111111110000111;
	 w_i = 24'b 111111111111111100011110;
	 next_valid = 1'b1;
	 end
	8'd171: begin 
	 w_r = 24'b 111111111111111101111100;
	 w_i = 24'b 111111111111111100100100;
	 next_valid = 1'b1;
	 end
	8'd172: begin 
	 w_r = 24'b 111111111111111101110010;
	 w_i = 24'b 111111111111111100101011;
	 next_valid = 1'b1;
	 end
	8'd173: begin 
	 w_r = 24'b 111111111111111101101000;
	 w_i = 24'b 111111111111111100110010;
	 next_valid = 1'b1;
	 end
	8'd174: begin 
	 w_r = 24'b 111111111111111101011110;
	 w_i = 24'b 111111111111111100111010;
	 next_valid = 1'b1;
	 end
	8'd175: begin 
	 w_r = 24'b 111111111111111101010100;
	 w_i = 24'b 111111111111111101000010;
	 next_valid = 1'b1;
	 end
	8'd176: begin 
	 w_r = 24'b 111111111111111101001011;
	 w_i = 24'b 111111111111111101001011;
	 next_valid = 1'b1;
	 end
	8'd177: begin 
	 w_r = 24'b 111111111111111101000010;
	 w_i = 24'b 111111111111111101010100;
	 next_valid = 1'b1;
	 end
	8'd178: begin 
	 w_r = 24'b 111111111111111100111010;
	 w_i = 24'b 111111111111111101011110;
	 next_valid = 1'b1;
	 end
	8'd179: begin 
	 w_r = 24'b 111111111111111100110010;
	 w_i = 24'b 111111111111111101101000;
	 next_valid = 1'b1;
	 end
	8'd180: begin 
	 w_r = 24'b 111111111111111100101011;
	 w_i = 24'b 111111111111111101110010;
	 next_valid = 1'b1;
	 end
	8'd181: begin 
	 w_r = 24'b 111111111111111100100100;
	 w_i = 24'b 111111111111111101111100;
	 next_valid = 1'b1;
	 end
	8'd182: begin 
	 w_r = 24'b 111111111111111100011110;
	 w_i = 24'b 111111111111111110000111;
	 next_valid = 1'b1;
	 end
	8'd183: begin 
	 w_r = 24'b 111111111111111100011001;
	 w_i = 24'b 111111111111111110010011;
	 next_valid = 1'b1;
	 end
	8'd184: begin 
	 w_r = 24'b 111111111111111100010011;
	 w_i = 24'b 111111111111111110011110;
	 next_valid = 1'b1;
	 end
	8'd185: begin 
	 w_r = 24'b 111111111111111100001111;
	 w_i = 24'b 111111111111111110101010;
	 next_valid = 1'b1;
	 end
	8'd186: begin 
	 w_r = 24'b 111111111111111100001011;
	 w_i = 24'b 111111111111111110110110;
	 next_valid = 1'b1;
	 end
	8'd187: begin 
	 w_r = 24'b 111111111111111100001000;
	 w_i = 24'b 111111111111111111000010;
	 next_valid = 1'b1;
	 end
	8'd188: begin 
	 w_r = 24'b 111111111111111100000101;
	 w_i = 24'b 111111111111111111001110;
	 next_valid = 1'b1;
	 end
	8'd189: begin 
	 w_r = 24'b 111111111111111100000011;
	 w_i = 24'b 111111111111111111011010;
	 next_valid = 1'b1;
	 end
	8'd190: begin 
	 w_r = 24'b 111111111111111100000001;
	 w_i = 24'b 111111111111111111100111;
	 next_valid = 1'b1;
	 end
	8'd191: begin 
	 w_r = 24'b 111111111111111100000000;
	 w_i = 24'b 111111111111111111110011;
	 next_valid = 1'b0;
	 end
	default: begin 
	 w_r = 24'b 000000000000000100000000;
	 w_i = 24'b 000000000000000000000000;
	 next_valid = 1'b1;
	 end
	endcase
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        count <= 0;
        valid <= 0;
    end
    else if(in_valid)
    begin
        count <= next_count;
        valid <= in_valid;
    end
    else if (valid)
    begin
        count <= next_count;
        valid <= next_valid;
    end
end
endmodule
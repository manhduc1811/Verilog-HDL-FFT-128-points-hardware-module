%Creat DB:
clc;
clear all;
close all;

Nfft         =  128;
t            =  (0:1:Nfft/2-1);
TWFa         =  exp(-i*2*pi*t/Nfft);
			 
TWFa_re      =  real(TWFa);
TWFa_im      =  imag(TWFa);
			 
fiPo_TWFa_re = fi(TWFa_re,1,24,8);
fiPo_TWFa_im = fi(TWFa_im,1,24,8);

fprintf("Real value: \n");
fiPo_TWFa_re.data
fiPo_TWFa_im.data

fprintf("Int value: \n");
fiPo_TWFa_re.int
fiPo_TWFa_im.int

fprintf(" Corresponding fixed point value: \n");
fiPo_TWFa_re.bin
fiPo_TWFa_im.bin

%-------------------------------------------------------------
%to generate ROM-2 data:
clc;
N = 2;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*64/N);
	y		=	fiPo_TWFa_im(1 + t*64/N);
	formatr = 	"2'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
2'd2: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
2'd3: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
%-------------------------------------------------------------
%to generate ROM-4 data:
clc;
N = 4;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*64/N);
	y		=	fiPo_TWFa_im(1 + t*64/N);
	formatr = 	"3'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
3'd4: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
3'd5: begin 
 w_r = 24'b 000000000000000010110101;
 w_i = 24'b 111111111111111101001011;
 end
3'd6: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
3'd7: begin 
 w_r = 24'b 111111111111111101001011;
 w_i = 24'b 111111111111111101001011;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
%------------------------------------------------------------
%to generate ROM-8 data:
clc;
N = 8;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*64/N);
	y		=	fiPo_TWFa_im(1 + t*64/N);
	formatr = 	"4'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
4'd8: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
4'd9: begin 
 w_r = 24'b 000000000000000011101101;
 w_i = 24'b 111111111111111110011110;
 end
4'd10: begin 
 w_r = 24'b 000000000000000010110101;
 w_i = 24'b 111111111111111101001011;
 end
4'd11: begin 
 w_r = 24'b 000000000000000001100010;
 w_i = 24'b 111111111111111100010011;
 end
4'd12: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
4'd13: begin 
 w_r = 24'b 111111111111111110011110;
 w_i = 24'b 111111111111111100010011;
 end
4'd14: begin 
 w_r = 24'b 111111111111111101001011;
 w_i = 24'b 111111111111111101001011;
 end
4'd15: begin 
 w_r = 24'b 111111111111111100010011;
 w_i = 24'b 111111111111111110011110;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
%------------------------------------------------------------
%to generate ROM-16 data:
clc;
N = 16;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*64/N);
	y		=	fiPo_TWFa_im(1 + t*64/N);
	formatr = 	"5'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
5'd16: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
5'd17: begin 
 w_r = 24'b 000000000000000011111011;
 w_i = 24'b 111111111111111111001110;
 end
5'd18: begin 
 w_r = 24'b 000000000000000011101101;
 w_i = 24'b 111111111111111110011110;
 end
5'd19: begin 
 w_r = 24'b 000000000000000011010101;
 w_i = 24'b 111111111111111101110010;
 end
5'd20: begin 
 w_r = 24'b 000000000000000010110101;
 w_i = 24'b 111111111111111101001011;
 end
5'd21: begin 
 w_r = 24'b 000000000000000010001110;
 w_i = 24'b 111111111111111100101011;
 end
5'd22: begin 
 w_r = 24'b 000000000000000001100010;
 w_i = 24'b 111111111111111100010011;
 end
5'd23: begin 
 w_r = 24'b 000000000000000000110010;
 w_i = 24'b 111111111111111100000101;
 end
5'd24: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
5'd25: begin 
 w_r = 24'b 111111111111111111001110;
 w_i = 24'b 111111111111111100000101;
 end
5'd26: begin 
 w_r = 24'b 111111111111111110011110;
 w_i = 24'b 111111111111111100010011;
 end
5'd27: begin 
 w_r = 24'b 111111111111111101110010;
 w_i = 24'b 111111111111111100101011;
 end
5'd28: begin 
 w_r = 24'b 111111111111111101001011;
 w_i = 24'b 111111111111111101001011;
 end
5'd29: begin 
 w_r = 24'b 111111111111111100101011;
 w_i = 24'b 111111111111111101110010;
 end
5'd30: begin 
 w_r = 24'b 111111111111111100010011;
 w_i = 24'b 111111111111111110011110;
 end
5'd31: begin 
 w_r = 24'b 111111111111111100000101;
 w_i = 24'b 111111111111111111001110;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
%------------------------------------------------------------
%to generate ROM-32 data:
clc;
N = 32;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*64/N);
	y		=	fiPo_TWFa_im(1 + t*64/N);
	formatr = 	"6'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
6'd32: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
6'd33: begin 
 w_r = 24'b 000000000000000011111111;
 w_i = 24'b 111111111111111111100111;
 end
6'd34: begin 
 w_r = 24'b 000000000000000011111011;
 w_i = 24'b 111111111111111111001110;
 end
6'd35: begin 
 w_r = 24'b 000000000000000011110101;
 w_i = 24'b 111111111111111110110110;
 end
6'd36: begin 
 w_r = 24'b 000000000000000011101101;
 w_i = 24'b 111111111111111110011110;
 end
6'd37: begin 
 w_r = 24'b 000000000000000011100010;
 w_i = 24'b 111111111111111110000111;
 end
6'd38: begin 
 w_r = 24'b 000000000000000011010101;
 w_i = 24'b 111111111111111101110010;
 end
6'd39: begin 
 w_r = 24'b 000000000000000011000110;
 w_i = 24'b 111111111111111101011110;
 end
6'd40: begin 
 w_r = 24'b 000000000000000010110101;
 w_i = 24'b 111111111111111101001011;
 end
6'd41: begin 
 w_r = 24'b 000000000000000010100010;
 w_i = 24'b 111111111111111100111010;
 end
6'd42: begin 
 w_r = 24'b 000000000000000010001110;
 w_i = 24'b 111111111111111100101011;
 end
6'd43: begin 
 w_r = 24'b 000000000000000001111001;
 w_i = 24'b 111111111111111100011110;
 end
6'd44: begin 
 w_r = 24'b 000000000000000001100010;
 w_i = 24'b 111111111111111100010011;
 end
6'd45: begin 
 w_r = 24'b 000000000000000001001010;
 w_i = 24'b 111111111111111100001011;
 end
6'd46: begin 
 w_r = 24'b 000000000000000000110010;
 w_i = 24'b 111111111111111100000101;
 end
6'd47: begin 
 w_r = 24'b 000000000000000000011001;
 w_i = 24'b 111111111111111100000001;
 end
6'd48: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
6'd49: begin 
 w_r = 24'b 111111111111111111100111;
 w_i = 24'b 111111111111111100000001;
 end
6'd50: begin 
 w_r = 24'b 111111111111111111001110;
 w_i = 24'b 111111111111111100000101;
 end
6'd51: begin 
 w_r = 24'b 111111111111111110110110;
 w_i = 24'b 111111111111111100001011;
 end
6'd52: begin 
 w_r = 24'b 111111111111111110011110;
 w_i = 24'b 111111111111111100010011;
 end
6'd53: begin 
 w_r = 24'b 111111111111111110000111;
 w_i = 24'b 111111111111111100011110;
 end
6'd54: begin 
 w_r = 24'b 111111111111111101110010;
 w_i = 24'b 111111111111111100101011;
 end
6'd55: begin 
 w_r = 24'b 111111111111111101011110;
 w_i = 24'b 111111111111111100111010;
 end
6'd56: begin 
 w_r = 24'b 111111111111111101001011;
 w_i = 24'b 111111111111111101001011;
 end
6'd57: begin 
 w_r = 24'b 111111111111111100111010;
 w_i = 24'b 111111111111111101011110;
 end
6'd58: begin 
 w_r = 24'b 111111111111111100101011;
 w_i = 24'b 111111111111111101110010;
 end
6'd59: begin 
 w_r = 24'b 111111111111111100011110;
 w_i = 24'b 111111111111111110000111;
 end
6'd60: begin 
 w_r = 24'b 111111111111111100010011;
 w_i = 24'b 111111111111111110011110;
 end
6'd61: begin 
 w_r = 24'b 111111111111111100001011;
 w_i = 24'b 111111111111111110110110;
 end
6'd62: begin 
 w_r = 24'b 111111111111111100000101;
 w_i = 24'b 111111111111111111001110;
 end
6'd63: begin 
 w_r = 24'b 111111111111111100000001;
 w_i = 24'b 111111111111111111100111;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
 %------------------------------------------------------------
%to generate ROM-64 data:
% Notice: count = 2*N+t
% Notice: "next_valid = 1'b1;"
% Notice: "next_valid = 1'b0;" for s_count=191
clc;
N = 64;
fprintf("case(count)\n");
for t = 0:(N-1)
	count 	= 	2*N+t;
	x		=	fiPo_TWFa_re(1 + t*64/N);
	y		=	fiPo_TWFa_im(1 + t*64/N);
	formatr = 	"8'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n next_valid = 1'b1;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n next_valid = 1'b1;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
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
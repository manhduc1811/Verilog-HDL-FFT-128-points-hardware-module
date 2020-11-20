module tb_FFT128;

	parameter 					FFT_size		= 128;
	parameter 					IN_width		= 12;
	parameter 					OUT_width		= 16;
	parameter 					latency_limit	= 260;

	parameter 					cycle			= 10.0;
	
	integer 					j, latency;
   reg signed	[IN_width-1:0] int_r [0:FFT_size-1];
   reg signed	[IN_width-1:0] int_i [0:FFT_size-1];
	reg 						clk, rst_n, in_valid;
	wire 						out_valid;
	reg signed [IN_width-1:0] 	din_r, din_i;
	wire signed [OUT_width-1:0] dout_r, dout_i;

	always #(cycle/2.0) 
		clk = ~clk;

	FFT128 uut_FFT128(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.din_r(din_r),
		.din_i(din_i),
		.out_valid(out_valid),
		.dout_r(dout_r),
		.dout_i(dout_i)
	);
	
	initial begin
		int_r[0] =  0;
		int_r[1] =  260;
		int_r[2] =  34;
		int_r[3] =  618;
		int_r[4] =  221;
		int_r[5] =  622;
		int_r[6] =  512;
		int_r[7] =  366;
		int_r[8] =  665;
		int_r[9] =  106;
		int_r[10] =  477;
		int_r[11] =  4;
		int_r[12] =  -1;
		int_r[13] =  -5;
		int_r[14] =  -478;
		int_r[15] =  -107;
		int_r[16] =  -666;
		int_r[17] =  -367;
		int_r[18] =  -513;
		int_r[19] =  -623;
		int_r[20] =  -222;
		int_r[21] =  -619;
		int_r[22] =  -35;
		int_r[23] =  -261;
		int_r[24] =  -1;
		int_r[25] =  260;
		int_r[26] =  34;
		int_r[27] =  618;
		int_r[28] =  221;
		int_r[29] =  622;
		int_r[30] =  511;
		int_r[31] =  366;
		int_r[32] =  665;
		int_r[33] =  106;
		int_r[34] =  477;
		int_r[35] =  4;
		int_r[36] =  0;
		int_r[37] =  -5;
		int_r[38] =  -478;
		int_r[39] =  -107;
		int_r[40] =  -666;
		int_r[41] =  -367;
		int_r[42] =  -513;
		int_r[43] =  -623;
		int_r[44] =  -222;
		int_r[45] =  -619;
		int_r[46] =  -35;
		int_r[47] =  -261;
		int_r[48] =  -1;
		int_r[49] =  260;
		int_r[50] =  34;
		int_r[51] =  618;
		int_r[52] =  221;
		int_r[53] =  622;
		int_r[54] =  512;
		int_r[55] =  366;
		int_r[56] =  665;
		int_r[57] =  106;
		int_r[58] =  477;
		int_r[59] =  4;
		int_r[60] =  0;
		int_r[61] =  -5;
		int_r[62] =  -478;
		int_r[63] =  -107;
		int_r[64] =  -666;
		int_r[65] =  -367;
		int_r[66] =  -513;
		int_r[67] =  -623;
		int_r[68] =  -222;
		int_r[69] =  -619;
		int_r[70] =  -35;
		int_r[71] =  -261;
		int_r[72] =  0;
		int_r[73] =  260;
		int_r[74] =  34;
		int_r[75] =  618;
		int_r[76] =  221;
		int_r[77] =  622;
		int_r[78] =  511;
		int_r[79] =  366;
		int_r[80] =  665;
		int_r[81] =  106;
		int_r[82] =  477;
		int_r[83] =  4;
		int_r[84] =  0;
		int_r[85] =  -5;
		int_r[86] =  -478;
		int_r[87] =  -107;
		int_r[88] =  -666;
		int_r[89] =  -367;
		int_r[90] =  -513;
		int_r[91] =  -623;
		int_r[92] =  -222;
		int_r[93] =  -619;
		int_r[94] =  -35;
		int_r[95] =  -261;
		int_r[96] =  -1;
		int_r[97] =  260;
		int_r[98] =  34;
		int_r[99] =  618;
		int_r[100] =  221;
		int_r[101] =  622;
		int_r[102] =  512;
		int_r[103] =  366;
		int_r[104] =  665;
		int_r[105] =  106;
		int_r[106] =  477;
		int_r[107] =  4;
		int_r[108] =  0;
		int_r[109] =  -5;
		int_r[110] =  -478;
		int_r[111] =  -107;
		int_r[112] =  -666;
		int_r[113] =  -367;
		int_r[114] =  -512;
		int_r[115] =  -623;
		int_r[116] =  -222;
		int_r[117] =  -619;
		int_r[118] =  -35;
		int_r[119] =  -261;
		int_r[120] =  -1;
		int_r[121] =  260;
		int_r[122] =  34;
		int_r[123] =  618;
		int_r[124] =  221;
		int_r[125] =  622;
		int_r[126] =  511;
		int_r[127] =  366;
	end
	initial begin
		int_i[0] =  0;
		int_i[1] =  0;
		int_i[2] =  0;
		int_i[3] =  0;
		int_i[4] =  0;
		int_i[5] =  0;
		int_i[6] =  0;
		int_i[7] =  0;
		int_i[8] =  0;
		int_i[9] =  0;
		int_i[10] =  0;
		int_i[11] =  0;
		int_i[12] =  0;
		int_i[13] =  0;
		int_i[14] =  0;
		int_i[15] =  0;
		int_i[16] =  0;
		int_i[17] =  0;
		int_i[18] =  0;
		int_i[19] =  0;
		int_i[20] =  0;
		int_i[21] =  0;
		int_i[22] =  0;
		int_i[23] =  0;
		int_i[24] =  0;
		int_i[25] =  0;
		int_i[26] =  0;
		int_i[27] =  0;
		int_i[28] =  0;
		int_i[29] =  0;
		int_i[30] =  0;
		int_i[31] =  0;
		int_i[32] =  0;
		int_i[33] =  0;
		int_i[34] =  0;
		int_i[35] =  0;
		int_i[36] =  0;
		int_i[37] =  0;
		int_i[38] =  0;
		int_i[39] =  0;
		int_i[40] =  0;
		int_i[41] =  0;
		int_i[42] =  0;
		int_i[43] =  0;
		int_i[44] =  0;
		int_i[45] =  0;
		int_i[46] =  0;
		int_i[47] =  0;
		int_i[48] =  0;
		int_i[49] =  0;
		int_i[50] =  0;
		int_i[51] =  0;
		int_i[52] =  0;
		int_i[53] =  0;
		int_i[54] =  0;
		int_i[55] =  0;
		int_i[56] =  0;
		int_i[57] =  0;
		int_i[58] =  0;
		int_i[59] =  0;
		int_i[60] =  0;
		int_i[61] =  0;
		int_i[62] =  0;
		int_i[63] =  0;
		int_i[64] =  0;
		int_i[65] =  0;
		int_i[66] =  0;
		int_i[67] =  0;
		int_i[68] =  0;
		int_i[69] =  0;
		int_i[70] =  0;
		int_i[71] =  0;
		int_i[72] =  0;
		int_i[73] =  0;
		int_i[74] =  0;
		int_i[75] =  0;
		int_i[76] =  0;
		int_i[77] =  0;
		int_i[78] =  0;
		int_i[79] =  0;
		int_i[80] =  0;
		int_i[81] =  0;
		int_i[82] =  0;
		int_i[83] =  0;
		int_i[84] =  0;
		int_i[85] =  0;
		int_i[86] =  0;
		int_i[87] =  0;
		int_i[88] =  0;
		int_i[89] =  0;
		int_i[90] =  0;
		int_i[91] =  0;
		int_i[92] =  0;
		int_i[93] =  0;
		int_i[94] =  0;
		int_i[95] =  0;
		int_i[96] =  0;
		int_i[97] =  0;
		int_i[98] =  0;
		int_i[99] =  0;
		int_i[100] =  0;
		int_i[101] =  0;
		int_i[102] =  0;
		int_i[103] =  0;
		int_i[104] =  0;
		int_i[105] =  0;
		int_i[106] =  0;
		int_i[107] =  0;
		int_i[108] =  0;
		int_i[109] =  0;
		int_i[110] =  0;
		int_i[111] =  0;
		int_i[112] =  0;
		int_i[113] =  0;
		int_i[114] =  0;
		int_i[115] =  0;
		int_i[116] =  0;
		int_i[117] =  0;
		int_i[118] =  0;
		int_i[119] =  0;
		int_i[120] =  0;
		int_i[121] =  0;
		int_i[122] =  0;
		int_i[123] =  0;
		int_i[124] =  0;
		int_i[125] =  0;
		int_i[126] =  0;
		int_i[127] =  0;
	end
	
	initial begin
		clk = 0;
		rst_n = 1;
		in_valid = 0;

		@(negedge clk);
		@(negedge clk) 
			rst_n = 0;
		@(negedge clk) 
			rst_n = 1;
		@(negedge clk);

		for(j=0;j<FFT_size;j=j+1) 
		begin
			@(negedge clk);
			in_valid 	= 1;
			din_r 		= int_r[j];
			din_i 		= int_i[j];
		end
		@(negedge clk) 
			in_valid = 0;

		for(j=0;j<FFT_size;j=j+1) 
		begin
			while(!out_valid) 
			begin
				@(negedge clk) 
					latency = latency + 1;
				if(latency > latency_limit) 
				begin
					$display("Latency too long (> %0d cycles)", latency_limit);
					$stop;
				end
			end	
			@(negedge clk);
		end
		$stop;
	end
endmodule
	


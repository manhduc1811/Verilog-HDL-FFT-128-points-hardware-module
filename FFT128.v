module FFT128(
input                     clk,
input                     rst_n,
input                     in_valid,
input signed       [11:0] din_r,
input signed       [11:0] din_i,
output                    out_valid,
output reg signed  [15:0] dout_r,
output reg signed  [15:0] dout_i
);

integer i;
reg signed  [15:0] result_r[0:127];
reg signed  [15:0] result_i[0:127];
reg signed  [15:0] result_r_ns[0:127];
reg signed  [15:0] result_i_ns[0:127];
reg signed  [15:0] next_dout_r;
reg signed  [15:0] next_dout_i;
reg         [7:0]   count_y;
reg         [7:0]   next_count_y;

reg signed  [23:0] din_r_reg,din_i_reg;
reg                in_valid_reg,r6_valid,next_r6_valid;
reg         [1:0]  no7_state;
reg                s7_count,next_s7_count;
reg                next_over,over;
reg                assign_out;
reg                next_out_valid;
reg         [6:0]  y_1_delay;

wire        [23:0] out_r,out_i;
wire        [6:0]  y_1;
wire        [23:0] din_r_wire,din_i_wire;

assign out_valid 	= assign_out;
assign y_1 			= (count_y>7'd0)? (count_y - 7'd1) : count_y; 
assign din_r_wire	= din_r_reg;
assign din_i_wire   = din_i_reg;
/////////////////////////////////////////////////////////
wire [1:0]  rom64_state;
wire [23:0] rom64_w_r,rom64_w_i;
wire [23:0] shift_64_dout_r,shift_64_dout_i;
wire [23:0] radix_no1_delay_r,radix_no1_delay_i;
wire [23:0] radix_no1_op_r,radix_no1_op_i;
wire radix_no1_outvalid;

wire [1:0]  rom32_state;
wire [23:0] rom32_w_r,rom32_w_i;
wire [23:0] shift_32_dout_r,shift_32_dout_i;
wire [23:0] radix_no2_delay_r,radix_no2_delay_i;
wire [23:0] radix_no2_op_r,radix_no2_op_i;
wire radix_no2_outvalid;

wire [1:0] rom16_state;
wire [23:0]rom16_w_r,rom16_w_i;
wire [23:0]shift_16_dout_r,shift_16_dout_i;
wire [23:0]radix_no3_delay_r,radix_no3_delay_i;
wire [23:0]radix_no3_op_r,radix_no3_op_i;
wire radix_no3_outvalid;

wire [1:0] rom8_state;
wire [23:0]rom8_w_r,rom8_w_i;
wire [23:0]shift_8_dout_r,shift_8_dout_i;
wire [23:0]radix_no4_delay_r,radix_no4_delay_i;
wire [23:0]radix_no4_op_r,radix_no4_op_i;
wire radix_no4_outvalid;

wire [1:0] rom4_state;
wire [23:0]rom4_w_r,rom4_w_i;
wire [23:0]shift_4_dout_r,shift_4_dout_i;
wire [23:0]radix_no5_delay_r,radix_no5_delay_i;
wire [23:0]radix_no5_op_r,radix_no5_op_i;
wire radix_no5_outvalid;

wire [1:0] rom2_state;
wire [23:0]rom2_w_r,rom2_w_i;
wire [23:0]shift_2_dout_r,shift_2_dout_i;
wire [23:0]radix_no6_delay_r,radix_no6_delay_i;
wire [23:0]radix_no6_op_r,radix_no6_op_i;
wire radix_no6_outvalid;

wire [23:0]shift_1_dout_r,shift_1_dout_i;
wire [23:0]radix_no7_delay_r,radix_no7_delay_i;
wire [23:0]radix_no7_op_r,radix_no7_op_i;

////////////////////////////////////Step 1///////
radix2 radix_no1(
.state(rom64_state),//state ctrl
.din_a_r(shift_64_dout_r),//fb
.din_a_i(shift_64_dout_i),//fb
.din_b_r(din_r_wire),//input
.din_b_i(din_i_wire),//input
.w_r(rom64_w_r),//twindle_r
.w_i(rom64_w_i),//twindle_i
.op_r(radix_no1_op_r),
.op_i(radix_no1_op_i),
.delay_r(radix_no1_delay_r),
.delay_i(radix_no1_delay_i),
.outvalid(radix_no1_outvalid)
);
shift_64 shift_64(
.clk(clk),.rst_n(rst_n),
.in_valid(in_valid_reg),
.din_r(radix_no1_delay_r),
.din_i(radix_no1_delay_i),
.dout_r(shift_64_dout_r),
.dout_i(shift_64_dout_i)
);
ROM_64 rom64(
.clk(clk),
.in_valid(in_valid_reg),
.rst_n(rst_n),
.w_r(rom64_w_r),
.w_i(rom64_w_i),
.state(rom64_state)
);
////////////////////////////////////Step 2///////
radix2 radix_no2(
.state(rom32_state),//state ctrl
.din_a_r(shift_32_dout_r),//fb
.din_a_i(shift_32_dout_i),//fb
.din_b_r(radix_no1_op_r),//input
.din_b_i(radix_no1_op_i),//input
.w_r(rom32_w_r),//twindle
.w_i(rom32_w_i),//d
.op_r(radix_no2_op_r),
.op_i(radix_no2_op_i),
.delay_r(radix_no2_delay_r),
.delay_i(radix_no2_delay_i),
.outvalid(radix_no2_outvalid)
);
shift_32 shift_32(
.clk(clk),.rst_n(rst_n),
.in_valid(radix_no1_outvalid),
.din_r(radix_no2_delay_r),
.din_i(radix_no2_delay_i),
.dout_r(shift_32_dout_r),
.dout_i(shift_32_dout_i)
);
ROM_32 rom32(
.clk(clk),
.in_valid(radix_no1_outvalid),
.rst_n(rst_n),
.w_r(rom32_w_r),
.w_i(rom32_w_i),
.state(rom32_state)
);
////////////////////////////////////Step 3///////
radix2 radix_no3(
.state(rom16_state),//state ctrl
.din_a_r(shift_16_dout_r),//fb
.din_a_i(shift_16_dout_i),//fb
.din_b_r(radix_no2_op_r),//input
.din_b_i(radix_no2_op_i),//input
.w_r(rom16_w_r),//twindle
.w_i(rom16_w_i),//d
.op_r(radix_no3_op_r),
.op_i(radix_no3_op_i),
.delay_r(radix_no3_delay_r),
.delay_i(radix_no3_delay_i),
.outvalid(radix_no3_outvalid)
);
shift_16 shift_16(
.clk(clk),.rst_n(rst_n),
.in_valid(radix_no2_outvalid),
.din_r(radix_no3_delay_r),
.din_i(radix_no3_delay_i),
.dout_r(shift_16_dout_r),
.dout_i(shift_16_dout_i)  
);
ROM_16 rom16(
.clk(clk),
.in_valid(radix_no2_outvalid),
.rst_n(rst_n),
.w_r(rom16_w_r),
.w_i(rom16_w_i),
.state(rom16_state)
);
////////////////////////////////////Step 4///////
radix2 radix_no4(
.state(rom8_state),//state ctrl
.din_a_r(shift_8_dout_r),//fb
.din_a_i(shift_8_dout_i),//fb
.din_b_r(radix_no3_op_r),//input
.din_b_i(radix_no3_op_i),//input
.w_r(rom8_w_r),//twindle
.w_i(rom8_w_i),//d
.op_r(radix_no4_op_r),
.op_i(radix_no4_op_i),
.delay_r(radix_no4_delay_r),
.delay_i(radix_no4_delay_i),
.outvalid(radix_no4_outvalid)
);
shift_8 shift_8(
.clk(clk),.rst_n(rst_n),
.in_valid(radix_no3_outvalid),
.din_r(radix_no4_delay_r),
.din_i(radix_no4_delay_i),
.dout_r(shift_8_dout_r),
.dout_i(shift_8_dout_i)
);
ROM_8 rom8(
.clk(clk),
.in_valid(radix_no3_outvalid),
.rst_n(rst_n),
.w_r(rom8_w_r),
.w_i(rom8_w_i),
.state(rom8_state)
);
////////////////////////////////////Step 5///////
radix2 radix_no5(
.state(rom4_state),//state ctrl
.din_a_r(shift_4_dout_r),//fb
.din_a_i(shift_4_dout_i),//fb
.din_b_r(radix_no4_op_r),//input
.din_b_i(radix_no4_op_i),//input
.w_r(rom4_w_r),//twindle
.w_i(rom4_w_i),//d
.op_r(radix_no5_op_r),
.op_i(radix_no5_op_i),
.delay_r(radix_no5_delay_r),
.delay_i(radix_no5_delay_i),
.outvalid(radix_no5_outvalid)
);
shift_4 shift_4(
.clk(clk),.rst_n(rst_n),
.in_valid(radix_no4_outvalid),
.din_r(radix_no5_delay_r),
.din_i(radix_no5_delay_i),
.dout_r(shift_4_dout_r),
.dout_i(shift_4_dout_i)
);
ROM_4 rom4(
.clk(clk),
.in_valid(radix_no4_outvalid),
.rst_n(rst_n),
.w_r(rom4_w_r),
.w_i(rom4_w_i),
.state(rom4_state)
);
////////////////////////////////////Step 6///////
radix2 radix_no6(
.state(rom2_state),//state ctrl
.din_a_r(shift_2_dout_r),//fb
.din_a_i(shift_2_dout_i),//fb
.din_b_r(radix_no5_op_r),//input
.din_b_i(radix_no5_op_i),//input
.w_r(rom2_w_r),//twindle
.w_i(rom2_w_i),//d
.op_r(radix_no6_op_r),
.op_i(radix_no6_op_i),
.delay_r(radix_no6_delay_r),
.delay_i(radix_no6_delay_i),
.outvalid(radix_no6_outvalid)
);
shift_2 shift_2(
.clk(clk),.rst_n(rst_n),
.in_valid(radix_no5_outvalid),
.din_r(radix_no6_delay_r),
.din_i(radix_no6_delay_i),
.dout_r(shift_2_dout_r),
.dout_i(shift_2_dout_i)
);
ROM_2 rom2(
.clk(clk),
.in_valid(radix_no5_outvalid),
.rst_n(rst_n),
.w_r(rom2_w_r),
.w_i(rom2_w_i),
.state(rom2_state)
);
////////////////////////////////////Step 7///////
radix2 radix_no7(
.state(no7_state),//state ctrl
.din_a_r(shift_1_dout_r),//fb
.din_a_i(shift_1_dout_i),//fb
.din_b_r(radix_no6_op_r),//input
.din_b_i(radix_no6_op_i),//input
.w_r(24'd256),//twindle
.w_i(24'd0),//d
.op_r(out_r),
.op_i(out_i),
.delay_r(radix_no7_delay_r),
.delay_i(radix_no7_delay_i),
.outvalid()
);
shift_1 shift_1(
.clk(clk),.rst_n(rst_n),
.in_valid(radix_no6_outvalid),
.din_r(radix_no7_delay_r),
.din_i(radix_no7_delay_i),
.dout_r(shift_1_dout_r),
.dout_i(shift_1_dout_i)
);

/////////////////////////////////////////////////
always@(*)begin
    next_r6_valid = radix_no6_outvalid;
    if (r6_valid)next_s7_count = s7_count + 1;
    else next_s7_count = s7_count;
    
    if(r6_valid && s7_count == 1'b0)no7_state = 2'b01;
    else if(r6_valid && s7_count == 1'b1)no7_state = 2'b10;
    else no7_state = 2'b00;

    if(radix_no6_outvalid) next_count_y = count_y + 7'd1;
    else next_count_y = count_y;

    if(next_out_valid) begin
        next_dout_r = result_r[y_1_delay];
        next_dout_i = result_i[y_1_delay];
    end
    else begin
        next_dout_r = dout_r;
        next_dout_i = dout_i;
    end
end

/////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        din_r_reg 		<= 0;
        din_i_reg 		<= 0;
        in_valid_reg 	<= 0;
        s7_count 		<= 0;
        r6_valid 		<= 0;
        count_y 		<= 0;
        assign_out 		<= 0;
        over 			<= 0;
        dout_r 			<= 0;
        dout_i 			<= 0;
        y_1_delay 		<= 0;
        for (i=0;i<=127;i=i+1) begin
            result_r[i] <= 0;
            result_i[i] <= 0;
        end
    end
    else begin
        din_r_reg 		<= {{4{din_r[11]}},din_r,8'b0};
        din_i_reg 		<= {{4{din_i[11]}},din_i,8'b0};
        in_valid_reg 	<= in_valid;
        s7_count 		<= next_s7_count;
        r6_valid 		<= next_r6_valid;
        count_y  		<= next_count_y;
        assign_out 		<= next_out_valid;
        over 			<= next_over;
        y_1_delay 		<= y_1;
        dout_r 			<= next_dout_r;
        dout_i 			<= next_dout_i;
        for (i=0;i<=127;i=i+1) begin
            result_r[i] <= result_r_ns[i];
            result_i[i] <= result_i_ns[i];
        end
    end
end
/////////////////////////////////////////////////
always @(*) begin
    next_over = over;
    for (i=0;i<=127;i=i+1) begin
        result_r_ns[i] = result_r[i];
        result_i_ns[i] = result_i[i];
    end
    if(next_over==1'b1)next_out_valid = 1'b1;
    else next_out_valid = assign_out;

    if(over!=1'b1) begin
        case((y_1))
			7'd0 : begin
			   result_r_ns[127] = out_r[23:8];
			   result_i_ns[127] = out_i[23:8];
			end
			7'd1 : begin
			   result_r_ns[63] = out_r[23:8];
			   result_i_ns[63] = out_i[23:8];
			end
			7'd2 : begin
			   result_r_ns[31] = out_r[23:8];
			   result_i_ns[31] = out_i[23:8];
			end
			7'd3 : begin
			   result_r_ns[95] = out_r[23:8];
			   result_i_ns[95] = out_i[23:8];
			end
			7'd4 : begin
			   result_r_ns[15] = out_r[23:8];
			   result_i_ns[15] = out_i[23:8];
			end
			7'd5 : begin
			   result_r_ns[79] = out_r[23:8];
			   result_i_ns[79] = out_i[23:8];
			end
			7'd6 : begin
			   result_r_ns[47] = out_r[23:8];
			   result_i_ns[47] = out_i[23:8];
			end
			7'd7 : begin
			   result_r_ns[111] = out_r[23:8];
			   result_i_ns[111] = out_i[23:8];
			end
			7'd8 : begin
			   result_r_ns[7] = out_r[23:8];
			   result_i_ns[7] = out_i[23:8];
			end
			7'd9 : begin
			   result_r_ns[71] = out_r[23:8];
			   result_i_ns[71] = out_i[23:8];
			end
			7'd10 : begin
			   result_r_ns[39] = out_r[23:8];
			   result_i_ns[39] = out_i[23:8];
			end
			7'd11 : begin
			   result_r_ns[103] = out_r[23:8];
			   result_i_ns[103] = out_i[23:8];
			end
			7'd12 : begin
			   result_r_ns[23] = out_r[23:8];
			   result_i_ns[23] = out_i[23:8];
			end
			7'd13 : begin
			   result_r_ns[87] = out_r[23:8];
			   result_i_ns[87] = out_i[23:8];
			end
			7'd14 : begin
			   result_r_ns[55] = out_r[23:8];
			   result_i_ns[55] = out_i[23:8];
			end
			7'd15 : begin
			   result_r_ns[119] = out_r[23:8];
			   result_i_ns[119] = out_i[23:8];
			end
			7'd16 : begin
			   result_r_ns[3] = out_r[23:8];
			   result_i_ns[3] = out_i[23:8];
			end
			7'd17 : begin
			   result_r_ns[67] = out_r[23:8];
			   result_i_ns[67] = out_i[23:8];
			end
			7'd18 : begin
			   result_r_ns[35] = out_r[23:8];
			   result_i_ns[35] = out_i[23:8];
			end
			7'd19 : begin
			   result_r_ns[99] = out_r[23:8];
			   result_i_ns[99] = out_i[23:8];
			end
			7'd20 : begin
			   result_r_ns[19] = out_r[23:8];
			   result_i_ns[19] = out_i[23:8];
			end
			7'd21 : begin
			   result_r_ns[83] = out_r[23:8];
			   result_i_ns[83] = out_i[23:8];
			end
			7'd22 : begin
			   result_r_ns[51] = out_r[23:8];
			   result_i_ns[51] = out_i[23:8];
			end
			7'd23 : begin
			   result_r_ns[115] = out_r[23:8];
			   result_i_ns[115] = out_i[23:8];
			end
			7'd24 : begin
			   result_r_ns[11] = out_r[23:8];
			   result_i_ns[11] = out_i[23:8];
			end
			7'd25 : begin
			   result_r_ns[75] = out_r[23:8];
			   result_i_ns[75] = out_i[23:8];
			end
			7'd26 : begin
			   result_r_ns[43] = out_r[23:8];
			   result_i_ns[43] = out_i[23:8];
			end
			7'd27 : begin
			   result_r_ns[107] = out_r[23:8];
			   result_i_ns[107] = out_i[23:8];
			end
			7'd28 : begin
			   result_r_ns[27] = out_r[23:8];
			   result_i_ns[27] = out_i[23:8];
			end
			7'd29 : begin
			   result_r_ns[91] = out_r[23:8];
			   result_i_ns[91] = out_i[23:8];
			end
			7'd30 : begin
			   result_r_ns[59] = out_r[23:8];
			   result_i_ns[59] = out_i[23:8];
			end
			7'd31 : begin
			   result_r_ns[123] = out_r[23:8];
			   result_i_ns[123] = out_i[23:8];
			end
			7'd32 : begin
			   result_r_ns[1] = out_r[23:8];
			   result_i_ns[1] = out_i[23:8];
			end
			7'd33 : begin
			   result_r_ns[65] = out_r[23:8];
			   result_i_ns[65] = out_i[23:8];
			end
			7'd34 : begin
			   result_r_ns[33] = out_r[23:8];
			   result_i_ns[33] = out_i[23:8];
			end
			7'd35 : begin
			   result_r_ns[97] = out_r[23:8];
			   result_i_ns[97] = out_i[23:8];
			end
			7'd36 : begin
			   result_r_ns[17] = out_r[23:8];
			   result_i_ns[17] = out_i[23:8];
			end
			7'd37 : begin
			   result_r_ns[81] = out_r[23:8];
			   result_i_ns[81] = out_i[23:8];
			end
			7'd38 : begin
			   result_r_ns[49] = out_r[23:8];
			   result_i_ns[49] = out_i[23:8];
			end
			7'd39 : begin
			   result_r_ns[113] = out_r[23:8];
			   result_i_ns[113] = out_i[23:8];
			end
			7'd40 : begin
			   result_r_ns[9] = out_r[23:8];
			   result_i_ns[9] = out_i[23:8];
			end
			7'd41 : begin
			   result_r_ns[73] = out_r[23:8];
			   result_i_ns[73] = out_i[23:8];
			end
			7'd42 : begin
			   result_r_ns[41] = out_r[23:8];
			   result_i_ns[41] = out_i[23:8];
			end
			7'd43 : begin
			   result_r_ns[105] = out_r[23:8];
			   result_i_ns[105] = out_i[23:8];
			end
			7'd44 : begin
			   result_r_ns[25] = out_r[23:8];
			   result_i_ns[25] = out_i[23:8];
			end
			7'd45 : begin
			   result_r_ns[89] = out_r[23:8];
			   result_i_ns[89] = out_i[23:8];
			end
			7'd46 : begin
			   result_r_ns[57] = out_r[23:8];
			   result_i_ns[57] = out_i[23:8];
			end
			7'd47 : begin
			   result_r_ns[121] = out_r[23:8];
			   result_i_ns[121] = out_i[23:8];
			end
			7'd48 : begin
			   result_r_ns[5] = out_r[23:8];
			   result_i_ns[5] = out_i[23:8];
			end
			7'd49 : begin
			   result_r_ns[69] = out_r[23:8];
			   result_i_ns[69] = out_i[23:8];
			end
			7'd50 : begin
			   result_r_ns[37] = out_r[23:8];
			   result_i_ns[37] = out_i[23:8];
			end
			7'd51 : begin
			   result_r_ns[101] = out_r[23:8];
			   result_i_ns[101] = out_i[23:8];
			end
			7'd52 : begin
			   result_r_ns[21] = out_r[23:8];
			   result_i_ns[21] = out_i[23:8];
			end
			7'd53 : begin
			   result_r_ns[85] = out_r[23:8];
			   result_i_ns[85] = out_i[23:8];
			end
			7'd54 : begin
			   result_r_ns[53] = out_r[23:8];
			   result_i_ns[53] = out_i[23:8];
			end
			7'd55 : begin
			   result_r_ns[117] = out_r[23:8];
			   result_i_ns[117] = out_i[23:8];
			end
			7'd56 : begin
			   result_r_ns[13] = out_r[23:8];
			   result_i_ns[13] = out_i[23:8];
			end
			7'd57 : begin
			   result_r_ns[77] = out_r[23:8];
			   result_i_ns[77] = out_i[23:8];
			end
			7'd58 : begin
			   result_r_ns[45] = out_r[23:8];
			   result_i_ns[45] = out_i[23:8];
			end
			7'd59 : begin
			   result_r_ns[109] = out_r[23:8];
			   result_i_ns[109] = out_i[23:8];
			end
			7'd60 : begin
			   result_r_ns[29] = out_r[23:8];
			   result_i_ns[29] = out_i[23:8];
			end
			7'd61 : begin
			   result_r_ns[93] = out_r[23:8];
			   result_i_ns[93] = out_i[23:8];
			end
			7'd62 : begin
			   result_r_ns[61] = out_r[23:8];
			   result_i_ns[61] = out_i[23:8];
			end
			7'd63 : begin
			   result_r_ns[125] = out_r[23:8];
			   result_i_ns[125] = out_i[23:8];
			end
			7'd64 : begin
			   result_r_ns[0] = out_r[23:8];
			   result_i_ns[0] = out_i[23:8];
			end
			7'd65 : begin
			   result_r_ns[64] = out_r[23:8];
			   result_i_ns[64] = out_i[23:8];
			end
			7'd66 : begin
			   result_r_ns[32] = out_r[23:8];
			   result_i_ns[32] = out_i[23:8];
			end
			7'd67 : begin
			   result_r_ns[96] = out_r[23:8];
			   result_i_ns[96] = out_i[23:8];
			end
			7'd68 : begin
			   result_r_ns[16] = out_r[23:8];
			   result_i_ns[16] = out_i[23:8];
			end
			7'd69 : begin
			   result_r_ns[80] = out_r[23:8];
			   result_i_ns[80] = out_i[23:8];
			end
			7'd70 : begin
			   result_r_ns[48] = out_r[23:8];
			   result_i_ns[48] = out_i[23:8];
			end
			7'd71 : begin
			   result_r_ns[112] = out_r[23:8];
			   result_i_ns[112] = out_i[23:8];
			end
			7'd72 : begin
			   result_r_ns[8] = out_r[23:8];
			   result_i_ns[8] = out_i[23:8];
			end
			7'd73 : begin
			   result_r_ns[72] = out_r[23:8];
			   result_i_ns[72] = out_i[23:8];
			end
			7'd74 : begin
			   result_r_ns[40] = out_r[23:8];
			   result_i_ns[40] = out_i[23:8];
			end
			7'd75 : begin
			   result_r_ns[104] = out_r[23:8];
			   result_i_ns[104] = out_i[23:8];
			end
			7'd76 : begin
			   result_r_ns[24] = out_r[23:8];
			   result_i_ns[24] = out_i[23:8];
			end
			7'd77 : begin
			   result_r_ns[88] = out_r[23:8];
			   result_i_ns[88] = out_i[23:8];
			end
			7'd78 : begin
			   result_r_ns[56] = out_r[23:8];
			   result_i_ns[56] = out_i[23:8];
			end
			7'd79 : begin
			   result_r_ns[120] = out_r[23:8];
			   result_i_ns[120] = out_i[23:8];
			end
			7'd80 : begin
			   result_r_ns[4] = out_r[23:8];
			   result_i_ns[4] = out_i[23:8];
			end
			7'd81 : begin
			   result_r_ns[68] = out_r[23:8];
			   result_i_ns[68] = out_i[23:8];
			end
			7'd82 : begin
			   result_r_ns[36] = out_r[23:8];
			   result_i_ns[36] = out_i[23:8];
			end
			7'd83 : begin
			   result_r_ns[100] = out_r[23:8];
			   result_i_ns[100] = out_i[23:8];
			end
			7'd84 : begin
			   result_r_ns[20] = out_r[23:8];
			   result_i_ns[20] = out_i[23:8];
			end
			7'd85 : begin
			   result_r_ns[84] = out_r[23:8];
			   result_i_ns[84] = out_i[23:8];
			end
			7'd86 : begin
			   result_r_ns[52] = out_r[23:8];
			   result_i_ns[52] = out_i[23:8];
			end
			7'd87 : begin
			   result_r_ns[116] = out_r[23:8];
			   result_i_ns[116] = out_i[23:8];
			end
			7'd88 : begin
			   result_r_ns[12] = out_r[23:8];
			   result_i_ns[12] = out_i[23:8];
			end
			7'd89 : begin
			   result_r_ns[76] = out_r[23:8];
			   result_i_ns[76] = out_i[23:8];
			end
			7'd90 : begin
			   result_r_ns[44] = out_r[23:8];
			   result_i_ns[44] = out_i[23:8];
			end
			7'd91 : begin
			   result_r_ns[108] = out_r[23:8];
			   result_i_ns[108] = out_i[23:8];
			end
			7'd92 : begin
			   result_r_ns[28] = out_r[23:8];
			   result_i_ns[28] = out_i[23:8];
			end
			7'd93 : begin
			   result_r_ns[92] = out_r[23:8];
			   result_i_ns[92] = out_i[23:8];
			end
			7'd94 : begin
			   result_r_ns[60] = out_r[23:8];
			   result_i_ns[60] = out_i[23:8];
			end
			7'd95 : begin
			   result_r_ns[124] = out_r[23:8];
			   result_i_ns[124] = out_i[23:8];
			end
			7'd96 : begin
			   result_r_ns[2] = out_r[23:8];
			   result_i_ns[2] = out_i[23:8];
			end
			7'd97 : begin
			   result_r_ns[66] = out_r[23:8];
			   result_i_ns[66] = out_i[23:8];
			end
			7'd98 : begin
			   result_r_ns[34] = out_r[23:8];
			   result_i_ns[34] = out_i[23:8];
			end
			7'd99 : begin
			   result_r_ns[98] = out_r[23:8];
			   result_i_ns[98] = out_i[23:8];
			end
			7'd100 : begin
			   result_r_ns[18] = out_r[23:8];
			   result_i_ns[18] = out_i[23:8];
			end
			7'd101 : begin
			   result_r_ns[82] = out_r[23:8];
			   result_i_ns[82] = out_i[23:8];
			end
			7'd102 : begin
			   result_r_ns[50] = out_r[23:8];
			   result_i_ns[50] = out_i[23:8];
			end
			7'd103 : begin
			   result_r_ns[114] = out_r[23:8];
			   result_i_ns[114] = out_i[23:8];
			end
			7'd104 : begin
			   result_r_ns[10] = out_r[23:8];
			   result_i_ns[10] = out_i[23:8];
			end
			7'd105 : begin
			   result_r_ns[74] = out_r[23:8];
			   result_i_ns[74] = out_i[23:8];
			end
			7'd106 : begin
			   result_r_ns[42] = out_r[23:8];
			   result_i_ns[42] = out_i[23:8];
			end
			7'd107 : begin
			   result_r_ns[106] = out_r[23:8];
			   result_i_ns[106] = out_i[23:8];
			end
			7'd108 : begin
			   result_r_ns[26] = out_r[23:8];
			   result_i_ns[26] = out_i[23:8];
			end
			7'd109 : begin
			   result_r_ns[90] = out_r[23:8];
			   result_i_ns[90] = out_i[23:8];
			end
			7'd110 : begin
			   result_r_ns[58] = out_r[23:8];
			   result_i_ns[58] = out_i[23:8];
			end
			7'd111 : begin
			   result_r_ns[122] = out_r[23:8];
			   result_i_ns[122] = out_i[23:8];
			end
			7'd112 : begin
			   result_r_ns[6] = out_r[23:8];
			   result_i_ns[6] = out_i[23:8];
			end
			7'd113 : begin
			   result_r_ns[70] = out_r[23:8];
			   result_i_ns[70] = out_i[23:8];
			end
			7'd114 : begin
			   result_r_ns[38] = out_r[23:8];
			   result_i_ns[38] = out_i[23:8];
			end
			7'd115 : begin
			   result_r_ns[102] = out_r[23:8];
			   result_i_ns[102] = out_i[23:8];
			end
			7'd116 : begin
			   result_r_ns[22] = out_r[23:8];
			   result_i_ns[22] = out_i[23:8];
			end
			7'd117 : begin
			   result_r_ns[86] = out_r[23:8];
			   result_i_ns[86] = out_i[23:8];
			end
			7'd118 : begin
			   result_r_ns[54] = out_r[23:8];
			   result_i_ns[54] = out_i[23:8];
			end
			7'd119 : begin
			   result_r_ns[118] = out_r[23:8];
			   result_i_ns[118] = out_i[23:8];
			end
			7'd120 : begin
			   result_r_ns[14] = out_r[23:8];
			   result_i_ns[14] = out_i[23:8];
			end
			7'd121 : begin
			   result_r_ns[78] = out_r[23:8];
			   result_i_ns[78] = out_i[23:8];
			end
			7'd122 : begin
			   result_r_ns[46] = out_r[23:8];
			   result_i_ns[46] = out_i[23:8];
			end
			7'd123 : begin
			   result_r_ns[110] = out_r[23:8];
			   result_i_ns[110] = out_i[23:8];
			end
			7'd124 : begin
			   result_r_ns[30] = out_r[23:8];
			   result_i_ns[30] = out_i[23:8];
			end
			7'd125 : begin
			   result_r_ns[94] = out_r[23:8];
			   result_i_ns[94] = out_i[23:8];
			end
			7'd126 : begin
			   result_r_ns[62] = out_r[23:8];
			   result_i_ns[62] = out_i[23:8];
			end
			7'd127 : begin
			   result_r_ns[126] = out_r[23:8];
			   result_i_ns[126] = out_i[23:8];
			   next_over = 1'b1; 
			end
        endcase
    end
end
endmodule

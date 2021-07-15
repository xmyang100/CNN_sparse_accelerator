`timescale 1ns/100ps

module Array_44_tb;
	
	parameter DATA_WIDTH = 8;
	parameter BLOCK_SIZE = 4;
	parameter SELECT_WIDTH = 2;
	parameter ARRAY_SIZE = 4;
	parameter Clk_period = 20;
	
	reg [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act0;
	reg [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act1;
	reg [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act2;
	reg [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act3;
	
	reg [DATA_WIDTH-1:0]Input_weight0;
	reg [DATA_WIDTH-1:0]Input_weight1;
	reg [DATA_WIDTH-1:0]Input_weight2;
	reg [DATA_WIDTH-1:0]Input_weight3;
	
	reg [4*DATA_WIDTH-1:0]Resultln0;
	reg [4*DATA_WIDTH-1:0]Resultln1;
	reg [4*DATA_WIDTH-1:0]Resultln2;
	reg [4*DATA_WIDTH-1:0]Resultln3;
	reg [4*DATA_WIDTH-1:0]Resultln4;
	reg [4*DATA_WIDTH-1:0]Resultln5;
	reg [4*DATA_WIDTH-1:0]Resultln6;
	reg [4*DATA_WIDTH-1:0]Resultln7;
	reg [4*DATA_WIDTH-1:0]Resultln8;
	reg [4*DATA_WIDTH-1:0]Resultln9;
	reg [4*DATA_WIDTH-1:0]Resultln10;
	reg [4*DATA_WIDTH-1:0]Resultln11;
	reg [4*DATA_WIDTH-1:0]Resultln12;
	reg [4*DATA_WIDTH-1:0]Resultln13;
	reg [4*DATA_WIDTH-1:0]Resultln14;
	reg [4*DATA_WIDTH-1:0]Resultln15;
	
	reg [3:0]mask0;
	reg [3:0]mask1;
	reg [3:0]mask2;
	reg [3:0]mask3;
	reg [3:0]mask4;
	reg [3:0]mask5;
	reg [3:0]mask6;
	reg [3:0]mask7;
	reg [3:0]mask8;
	reg [3:0]mask9;
	reg [3:0]mask10;
	reg [3:0]mask11;
	reg [3:0]mask12;
	reg [3:0]mask13;
	reg [3:0]mask14;
	reg [3:0]mask15;
	
	
	reg Block_control;
	reg Direction;
	reg Control;
	reg ResultCapture;
	reg Clk;
	reg rst;
	
	wire [4*DATA_WIDTH-1:0]Array_Output0;
	wire [4*DATA_WIDTH-1:0]Array_Output1;
	wire [4*DATA_WIDTH-1:0]Array_Output2;
	wire [4*DATA_WIDTH-1:0]Array_Output3;
	wire [4*DATA_WIDTH-1:0]Array_Output4;
	wire [4*DATA_WIDTH-1:0]Array_Output5;
	wire [4*DATA_WIDTH-1:0]Array_Output6;
	wire [4*DATA_WIDTH-1:0]Array_Output7;
	wire [4*DATA_WIDTH-1:0]Array_Output8;
	wire [4*DATA_WIDTH-1:0]Array_Output9;
	wire [4*DATA_WIDTH-1:0]Array_Output10;
	wire [4*DATA_WIDTH-1:0]Array_Output11;
	wire [4*DATA_WIDTH-1:0]Array_Output12;
	wire [4*DATA_WIDTH-1:0]Array_Output13;
	wire [4*DATA_WIDTH-1:0]Array_Output14;
	wire [4*DATA_WIDTH-1:0]Array_Output15;

	
	reg signed [4:0]cnt;
	
	Array_44 array(
		.Input_act0(Input_act0),
		.Input_act1(Input_act1),
		.Input_act2(Input_act2),
		.Input_act3(Input_act3),
		.Input_weight0(Input_weight0),
		.Input_weight1(Input_weight1),
		.Input_weight2(Input_weight2),
		.Input_weight3(Input_weight3),
		.Resultln0(Resultln0),
		.Resultln1(Resultln1),
		.Resultln2(Resultln2),
		.Resultln3(Resultln3),
		.Resultln4(Resultln4),
		.Resultln5(Resultln5),
		.Resultln6(Resultln6),
		.Resultln7(Resultln7),
		.Resultln8(Resultln8),
		.Resultln9(Resultln9),
		.Resultln10(Resultln10),
		.Resultln11(Resultln11),
		.Resultln12(Resultln12),
		.Resultln13(Resultln13),
		.Resultln14(Resultln14),
		.Resultln15(Resultln15),
		.mask0(mask0),
		.mask1(mask1),
		.mask2(mask2),
		.mask3(mask3),
		.mask4(mask4),
		.mask5(mask5),
		.mask6(mask6),
		.mask7(mask7),
		.mask8(mask8),
		.mask9(mask9),
		.mask10(mask10),
		.mask11(mask11),
		.mask12(mask12),
		.mask13(mask13),
		.mask14(mask14),
		.mask15(mask15),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.Array_Output0(Array_Output0),
		.Array_Output1(Array_Output1),
		.Array_Output2(Array_Output2),
		.Array_Output3(Array_Output3),
		.Array_Output4(Array_Output4),
		.Array_Output5(Array_Output5),
		.Array_Output6(Array_Output6),
		.Array_Output7(Array_Output7),
		.Array_Output8(Array_Output8),
		.Array_Output9(Array_Output9),
		.Array_Output10(Array_Output10),
		.Array_Output11(Array_Output11),
		.Array_Output12(Array_Output12),
		.Array_Output13(Array_Output13),
		.Array_Output14(Array_Output14),
		.Array_Output15(Array_Output15)
	);
	
	
	initial begin
		ResultCapture = 1;
		Block_control = 0;
		Direction = 0;
		Control = 0;
		rst = 0;
		Clk = 0;
		
		cnt = 0;
		
		Input_weight0 = 8'b00000001;
		Input_weight1 = 8'b00000001;
		Input_weight2 = 8'b00000001;
		Input_weight3 = 8'b00000001;
		
		Resultln0 = 200;
		Resultln1 = 210;
		Resultln2 = 220;
		Resultln3 = 230;
		Resultln4 = 200;
		Resultln5 = 210;
		Resultln6 = 220;
		Resultln7 = 230;
		Resultln8 = 200;
		Resultln9 = 210;
		Resultln10 = 220;
		Resultln11 = 230;
		Resultln12 = 200;
		Resultln13 = 210;
		Resultln14 = 220;
		Resultln15 = 230;
		
		
		Input_act0[DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act0[DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act0[DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act0[DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act0[DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act0[DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act0[DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act0[DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act0[DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act0[DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act0[DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act0[DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act0[DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act0[DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act0[DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act0[DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		Input_act1[DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act1[DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act1[DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act1[DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act1[DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act1[DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act1[DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act1[DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act1[DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act1[DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act1[DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act1[DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act1[DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act1[DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act1[DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act1[DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		Input_act2[DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act2[DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act2[DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act2[DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act2[DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act2[DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act2[DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act2[DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act2[DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act2[DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act2[DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act2[DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act2[DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act2[DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act2[DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act2[DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		Input_act3[DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act3[DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act3[DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act3[DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act3[DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act3[DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act3[DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act3[DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act3[DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act3[DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act3[DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act3[DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act3[DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act3[DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act3[DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act3[DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		mask0 = 4'b0000;
		mask4 = 4'b0000;
		mask8 = 4'b0011;
		mask12 = 4'b0000;
		
		#10
		
		#20
		rst = 1;
		mask0 = 4'b0001;
		mask4 = 4'b0001;
		mask8 = 4'b0100;
		mask12 = 4'b0001;
		
		#20
		mask0 = 4'b0010;
		mask4 = 4'b0010;
		mask8 = 4'b0101;
		mask12 = 4'b0010;
		
		#20
		mask0 = 4'b0110;
		mask4 = 4'b0011;
		mask8 = 4'b0111;
		mask12 = 4'b0011;
		
		#20
		mask0 = 4'b1000;
		mask4 = 4'b1100;
		mask8 = 4'b1000;
		mask12 = 4'b1000;
		
		#20
		mask0 = 4'b1010;
		mask4 = 4'b1101;
		mask8 = 4'b1010;
		mask12 = 4'b1010;
		
		#20
		mask0 = 4'b1101;
		mask4 = 4'b1110;
		mask8 = 4'b1100;
		mask12 = 4'b1101;
		
		#20
		mask0 = 4'b1111;
		mask4 = 4'b1111;
		mask8 = 4'b1110;
		mask12 = 4'b1111;
		Control = 1;
		
		
		//the first block
		#20
		
		#20
		mask0 = 4'b0010;
		mask4 = 4'b0000;
		mask8 = 4'b0001;
		mask12 = 4'b0100;
		
		#20
		mask0 = 4'b0011;
		mask4 = 4'b0100;
		mask8 = 4'b0010;
		mask12 = 4'b0101;
		
		#20
		mask0 = 4'b0100;
		mask4 = 4'b0101;
		mask8 = 4'b0100;
		mask12 = 4'b0110;
		
		#20
		mask0 = 4'b0110;
		mask4 = 4'b0110;
		mask8 = 4'b0111;
		mask12 = 4'b1000;
		
		#20
		mask0 = 4'b1001;
		mask4 = 4'b0111;
		mask8 = 4'b1000;
		mask12 = 4'b1001;
		
		#20
		mask0 = 4'b1011;
		mask4 = 4'b1000;
		mask8 = 4'b1001;
		mask12 = 4'b1010;
		
		#20
		mask0 = 4'b1101;
		mask4 = 4'b1101;
		mask8 = 4'b1101;
		mask12 = 4'b1100;
		
		#20
		mask0 = 4'b1110;
		mask4 = 4'b1111;
		mask8 = 4'b1110;
		mask12 = 4'b1101;
		
		#20
		
		#20 
		Control = 0;
		
		#20
		ResultCapture = 0;
		
		#20
		ResultCapture = 1;
		
		
	end
	
	always #(Clk_period/2) Clk = ~Clk;
	
	
	always @(posedge Clk) 
    begin
        if(cnt == 4'b01000)
        begin
            cnt <= 4'b00000;
            Block_control <= 0;
        end
		else if(cnt == -1||cnt == -2 ||  cnt == -3)
		begin
			cnt <= cnt + 1;
			Block_control <= 0;
		end
        else
        begin
            cnt <= cnt + 1;
            Block_control <= 1;
        end   
    end

	
endmodule
	
	
	
	
	
	
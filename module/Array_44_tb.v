`timescale 1ns/100ps

module Array_44_tb;
	
	parameter DATA_WIDTH = 8;
	parameter BLOCK_SIZE = 4;
	parameter SELECT_WIDTH = 2;
	parameter ARRAY_SIZE = 4;
	parameter Clk_period = 20
	
	reg [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act[ARRAY_SIZE-1:0];
	reg [DATA_WIDTH-1:0]Input_weight[ARRAY_SIZE-1:0];
	reg [DATA_WIDTH-1:0]Resultln[BLOCK_SIZE*ARRAY_SIZE-1:0];
	reg [3:0]mask[ARRAY_SIZE*ARRAY_SIZE-1:0];
	reg Block_control;
	reg Direction;
	reg Control;
	reg ResultCapture;
	reg Clk;
	reg rst
	wire [4*DATA_WIDTH-1:0]Array_Output[BLOCK_SIZE*ARRAY_SIZE-1:0];
	
	Array_44 array(
		.Input_act(Input_act),
		.Input_weight(Input_weight),
		.Resultln(Resultln),
		.mask(mask),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.Rst(Rst),
		.Array_Output(Array_Output)
	);
	
	
	initial begin
		ResultCapture = 1;
		Block_control = 0;
		Direction = 0;
		Control = 0;
		rst = 0;
		Clk = 0;
		
		Input_weight[0] = 8'b00000001;
		Input_weight[1] = 8'b00000001;
		Input_weight[2] = 8'b00000001;
		Input_weight[3] = 8'b00000001;
		
		Resultln[0] = 200;
		Resultln[1] = 210;
		Resultln[2] = 220;
		Resultln[3] = 230;
		Resultln[4] = 200;
		Resultln[5] = 210;
		Resultln[6] = 220;
		Resultln[7] = 230;
		Resultln[8] = 200;
		Resultln[9] = 210;
		Resultln[10] = 220;
		Resultln[11] = 230;
		Resultln[12] = 200;
		Resultln[13] = 210;
		Resultln[14] = 220;
		Resultln[15] = 230;
		
		
		Input_act[0][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00010000;
		Input_act[0][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000001;
		Input_act[0][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000010;
		Input_act[0][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000011;
		Input_act[0][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000100;
		Input_act[0][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000101;
		Input_act[0][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000110;
		Input_act[0][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00000111;
		Input_act[0][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001000;
		Input_act[0][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001001;
		Input_act[0][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001010;
		Input_act[0][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001011;
		Input_act[0][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001100;
		Input_act[0][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001101;
		Input_act[0][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001110;
		Input_act[0][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00001111;
		
		Input_act[1][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00010000;
		Input_act[1][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000001;
		Input_act[1][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000010;
		Input_act[1][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000011;
		Input_act[1][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000100;
		Input_act[1][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000101;
		Input_act[1][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000110;
		Input_act[1][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00000111;
		Input_act[1][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001000;
		Input_act[1][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001001;
		Input_act[1][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001010;
		Input_act[1][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001011;
		Input_act[1][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001100;
		Input_act[1][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001101;
		Input_act[1][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001110;
		Input_act[1][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00001111;
		
		Input_act[2][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00010000;
		Input_act[2][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000001;
		Input_act[2][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000010;
		Input_act[2][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000011;
		Input_act[2][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000100;
		Input_act[2][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000101;
		Input_act[2][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000110;
		Input_act[2][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00000111;
		Input_act[2][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001000;
		Input_act[2][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001001;
		Input_act[2][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001010;
		Input_act[2][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001011;
		Input_act[2][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001100;
		Input_act[2][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001101;
		Input_act[2][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001110;
		Input_act[2][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00001111;
		
		Input_act[3][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00010000;
		Input_act[3][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000001;
		Input_act[3][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000010;
		Input_act[3][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000011;
		Input_act[3][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000100;
		Input_act[3][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000101;
		Input_act[3][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000110;
		Input_act[3][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00000111;
		Input_act[3][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001000;
		Input_act[3][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001001;
		Input_act[3][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001010;
		Input_act[3][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001011;
		Input_act[3][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001100;
		Input_act[3][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001101;
		Input_act[3][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001110;
		Input_act[3][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00001111;
		
		mask[0] = 
		mask[1] = 
		mask[2] = 
		mask[3] = 
		mask[4] = 
		mask[5] = 
		mask[6] = 
		mask[7] = 
		mask[8] = 
		mask[9] = 
		mask[10] = 
		mask[11] = 
		mask[12] = 
		mask[13] = 
		mask[14] = 
		mask[15] = 


	
	end
	
	always #(Clk_period/2) Clk = ~Clk;
	
	
	
	
	
	
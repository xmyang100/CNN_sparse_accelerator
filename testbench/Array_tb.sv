`timescale 1ns/100ps

module Array_tb;
	
	parameter DATA_WIDTH = 8;
	parameter BLOCK_SIZE = 4;
	parameter SELECT_WIDTH = 2;
	parameter ARRAY_SIZE = 4;
	parameter Clk_period = 20;
	
	logic [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0] Input_act[ARRAY_SIZE-1:0];

	logic [DATA_WIDTH-1 :0] Input_weight[ARRAY_SIZE-1:0];

	logic [4*DATA_WIDTH-1:0]Resultln[BLOCK_SIZE*ARRAY_SIZE-1:0];

	logic [3:0]mask[ARRAY_SIZE*ARRAY_SIZE-1:0];

	logic Block_control;
	logic Direction;
	logic Control;
	logic ResultCapture;
	logic Clk;
	logic rst;
	
	logic [4*DATA_WIDTH-1:0]Array_Output[BLOCK_SIZE*ARRAY_SIZE-1:0];
	
	logic signed [4:0]cnt;
	
	Array array(
		.Input_act(Input_act),
		.Input_weight(Input_weight),
		.Resultln(Resultln),
		.mask(mask),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.Array_Output(Array_Output)
	);
	
	
	initial begin
		ResultCapture = 1;
		Block_control = 0;
		Direction = 0;
		Control = 0;
		rst = 0;
		Clk = 0;
		
		cnt = 0;
		
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
		
		
		Input_act[0][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act[0][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act[0][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act[0][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act[0][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act[0][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act[0][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act[0][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act[0][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act[0][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act[0][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act[0][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act[0][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act[0][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act[0][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act[0][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		Input_act[1][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act[1][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act[1][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act[1][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act[1][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act[1][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act[1][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act[1][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act[1][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act[1][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act[1][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act[1][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act[1][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act[1][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act[1][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act[1][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		Input_act[2][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act[2][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act[2][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act[2][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act[2][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act[2][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act[2][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act[2][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act[2][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act[2][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act[2][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act[2][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act[2][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act[2][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act[2][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act[2][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		Input_act[3][DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00000001;
		Input_act[3][DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000010;
		Input_act[3][DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000011;
		Input_act[3][DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000100;
		Input_act[3][DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000101;
		Input_act[3][DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000110;
		Input_act[3][DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000111;
		Input_act[3][DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00001000;
		Input_act[3][DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001001;
		Input_act[3][DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001010;
		Input_act[3][DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001011;
		Input_act[3][DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001100;
		Input_act[3][DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001101;
		Input_act[3][DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001110;
		Input_act[3][DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001111;
		Input_act[3][DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00010000;
		
		mask[0] = 4'b0000;
		mask[4] = 4'b0000;
		mask[8] = 4'b0011;
		mask[12] = 4'b0000;
		
		#10
		
		#20
		rst = 1;
		mask[0] = 4'b0001;
		mask[4] = 4'b0001;
		mask[8] = 4'b0100;
		mask[12] = 4'b0001;
		
		#20
		mask[0] = 4'b0010;
		mask[4] = 4'b0010;
		mask[8] = 4'b0101;
		mask[12] = 4'b0010;
		
		#20
		mask[0] = 4'b0110;
		mask[4] = 4'b0011;
		mask[8] = 4'b0111;
		mask[12] = 4'b0011;
		
		#20
		mask[0] = 4'b1000;
		mask[4] = 4'b1100;
		mask[8] = 4'b1000;
		mask[12] = 4'b1000;
		
		#20
		mask[0] = 4'b1010;
		mask[4] = 4'b1101;
		mask[8] = 4'b1010;
		mask[12] = 4'b1010;
		
		#20
		mask[0] = 4'b1101;
		mask[4] = 4'b1110;
		mask[8] = 4'b1100;
		mask[12] = 4'b1101;
		
		#20
		mask[0] = 4'b1111;
		mask[4] = 4'b1111;
		mask[8] = 4'b1110;
		mask[12] = 4'b1111;
		Control = 1;
		
		
		//the first block
		#20
		
		#20
		mask[0] = 4'b0010;
		mask[4] = 4'b0000;
		mask[8] = 4'b0001;
		mask[12] = 4'b0100;
		
		#20
		mask[0] = 4'b0011;
		mask[4] = 4'b0100;
		mask[8] = 4'b0010;
		mask[12] = 4'b0101;
		
		#20
		mask[0] = 4'b0100;
		mask[4] = 4'b0101;
		mask[8] = 4'b0100;
		mask[12] = 4'b0110;
		
		#20
		mask[0] = 4'b0110;
		mask[4] = 4'b0110;
		mask[8] = 4'b0111;
		mask[12] = 4'b1000;
		
		#20
		mask[0] = 4'b1001;
		mask[4] = 4'b0111;
		mask[8] = 4'b1000;
		mask[12] = 4'b1001;
		
		#20
		mask[0] = 4'b1011;
		mask[4] = 4'b1000;
		mask[8] = 4'b1001;
		mask[12] = 4'b1010;
		
		#20
		mask[0] = 4'b1101;
		mask[4] = 4'b1101;
		mask[8] = 4'b1101;
		mask[12] = 4'b1100;
		
		#20
		mask[0] = 4'b1110;
		mask[4] = 4'b1111;
		mask[8] = 4'b1110;
		mask[12] = 4'b1101;
		
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
	
	
	
	
	
	
`timescale 1ns/100ps
module CELL_UNIT_tb;
    parameter DATA_WIDTH = 8;
	parameter BLOCK_WIDTH = 4;
	parameter BLOCK_NUMBER = 16;
    parameter CLK_PERIOD = 20;

    reg [BLOCK_NUMBER*DATA_WIDTH-1:0]Input_act_data;
    reg [DATA_WIDTH-1:0]Input_weight;
    reg [4*DATA_WIDTH-1:0]ResultIn_0;
    reg [4*DATA_WIDTH-1:0]ResultIn_1;
    reg [4*DATA_WIDTH-1:0]ResultIn_2;
    reg [4*DATA_WIDTH-1:0]ResultIn_3;

    reg [BLOCK_WIDTH-1:0]mask;

    reg Block_control;
    reg Clk,Clk1,Clk2;
    reg Direction;
    reg Control;
    reg ResultCapture;
	reg rst;

    wire [4*DATA_WIDTH-1:0] Output_data_0;
    wire [4*DATA_WIDTH-1:0] Output_data_1;
    wire [4*DATA_WIDTH-1:0] Output_data_2;
    wire [4*DATA_WIDTH-1:0] Output_data_3;
    
    reg signed [4:0]cnt;

    CELL_UNIT cell_unit(
        .Input_act_data(Input_act_data),
        .Input_weight(Input_weight),
        .ResultIn_0(ResultIn_0),
        .ResultIn_1(ResultIn_1),
        .ResultIn_2(ResultIn_2),
        .ResultIn_3(ResultIn_3),
        .mask(mask),
        .Block_control(Block_control),
        .Clk1(Clk1),
		.rst(rst),
        .Direction(Direction),
        .Control(Control),
        .ResultCapture(ResultCapture),
        .Cell_Output_data_0(Output_data_0),
        .Cell_Output_data_1(Output_data_1),
        .Cell_Output_data_2(Output_data_2),
        .Cell_Output_data_3(Output_data_3)
    );

    initial begin
    	Block_control = 0;
		rst = 0;
		
		Input_weight = 8'b00000001;
		Clk = 0;
		Clk1 = 0;
		Clk2 = 0;

        mask = 8'b0000;
        Direction = 0;
        Control = 0;

        Input_act_data = 127'b0;

        cnt = 0;

        ResultIn_0 = 40;
        ResultIn_1 = 50;
        ResultIn_2 = 60;
        ResultIn_3 = 70;

        ResultCapture = 1;

        #10
		Input_act_data[DATA_WIDTH*1-1:DATA_WIDTH*0] = 8'b00010000;
		Input_act_data[DATA_WIDTH*2-1:DATA_WIDTH*1] = 8'b00000001;
		Input_act_data[DATA_WIDTH*3-1:DATA_WIDTH*2] = 8'b00000010;
		Input_act_data[DATA_WIDTH*4-1:DATA_WIDTH*3] = 8'b00000011;
		Input_act_data[DATA_WIDTH*5-1:DATA_WIDTH*4] = 8'b00000100;
		Input_act_data[DATA_WIDTH*6-1:DATA_WIDTH*5] = 8'b00000101;
		Input_act_data[DATA_WIDTH*7-1:DATA_WIDTH*6] = 8'b00000110;
		Input_act_data[DATA_WIDTH*8-1:DATA_WIDTH*7] = 8'b00000111;
		Input_act_data[DATA_WIDTH*9-1:DATA_WIDTH*8] = 8'b00001000;
		Input_act_data[DATA_WIDTH*10-1:DATA_WIDTH*9] = 8'b00001001;
		Input_act_data[DATA_WIDTH*11-1:DATA_WIDTH*10] = 8'b00001010;
		Input_act_data[DATA_WIDTH*12-1:DATA_WIDTH*11] = 8'b00001011;
		Input_act_data[DATA_WIDTH*13-1:DATA_WIDTH*12] = 8'b00001100;
		Input_act_data[DATA_WIDTH*14-1:DATA_WIDTH*13] = 8'b00001101;
		Input_act_data[DATA_WIDTH*15-1:DATA_WIDTH*14] = 8'b00001110;
		Input_act_data[DATA_WIDTH*16-1:DATA_WIDTH*15] = 8'b00001111;
		
		#20
		rst =1;
        mask = 4'b0010;

        #20 
        mask = 4'b0101;

        #20 
        mask = 4'b0110;

        #20 
        mask = 4'b0111;

        #20 
        mask = 4'b1000;

        #20 
        mask = 4'b1101;
        
        #20 
        mask = 4'b1111;

		Control = 1;
        /////
        
        #20
        
        #20 
        mask = 4'b0001;

        #20 
        mask = 4'b0010;

        #20 
        mask = 4'b0011;

        #20 
        mask = 4'b1000;

        #20 
        mask = 4'b1001;

        #20 
        mask = 4'b1010;

        #20 
        mask = 4'b1011;

        #20 
        mask = 4'b1110;
        
        #40
        
        Control = 0;

        #20
        ResultCapture = 0;

        #20
        ResultCapture = 1;
    end
    
    always #(CLK_PERIOD/2) Clk1 = ~Clk1;
 /*
    always @(posedge Clk)
    begin
        Clk1 <= ~Clk1; 
    end
    
    always @(negedge Clk)
    begin
        Clk2 <= ~Clk2; 
    end
 */   
    always@(posedge Clk1)
	begin
		Input_act_data[DATA_WIDTH*1-1:DATA_WIDTH*0] <= 8'b00010000;
		Input_act_data[DATA_WIDTH*2-1:DATA_WIDTH*1] <= 8'b00000001;
		Input_act_data[DATA_WIDTH*3-1:DATA_WIDTH*2] <= 8'b00000010;
		Input_act_data[DATA_WIDTH*4-1:DATA_WIDTH*3] <= 8'b00000011;
		Input_act_data[DATA_WIDTH*5-1:DATA_WIDTH*4] <= 8'b00000100;
		Input_act_data[DATA_WIDTH*6-1:DATA_WIDTH*5] <= 8'b00000101;
		Input_act_data[DATA_WIDTH*7-1:DATA_WIDTH*6] <= 8'b00000110;
		Input_act_data[DATA_WIDTH*8-1:DATA_WIDTH*7] <= 8'b00000111;
		Input_act_data[DATA_WIDTH*9-1:DATA_WIDTH*8] <= 8'b00001000;
		Input_act_data[DATA_WIDTH*10-1:DATA_WIDTH*9] <= 8'b00001001;
		Input_act_data[DATA_WIDTH*11-1:DATA_WIDTH*10] <= 8'b00001010;
		Input_act_data[DATA_WIDTH*12-1:DATA_WIDTH*11] <= 8'b00001011;
		Input_act_data[DATA_WIDTH*13-1:DATA_WIDTH*12] <= 8'b00001100;
		Input_act_data[DATA_WIDTH*14-1:DATA_WIDTH*13] <= 8'b00001101;
		Input_act_data[DATA_WIDTH*15-1:DATA_WIDTH*14] <= 8'b00001110;
		Input_act_data[DATA_WIDTH*16-1:DATA_WIDTH*15] <= 8'b00001111;
	end


    always @(posedge Clk1) 
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




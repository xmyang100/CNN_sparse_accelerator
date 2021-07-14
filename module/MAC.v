`timescale 1ns/100ps
module MAC (Input_act_data,Input_weight,mask,Block_control,Select,Clk,rst,Output_0,Output_1,Output_2,Output_3);

	parameter DATA_WIDTH = 8;
	parameter BLOCK_WIDTH = 4;
	parameter SELECT_WIDTH = 2;
	parameter BLOCK_NUMBER = 16;

    input [BLOCK_NUMBER*DATA_WIDTH-1:0]Input_act_data;
	input [DATA_WIDTH-1:0]Input_weight;

    input [BLOCK_WIDTH-1:0]mask;

    input Block_control;
	input [SELECT_WIDTH-1:0] Select;

    input Clk;
    input rst;

    output wire [4*DATA_WIDTH-1:0] Output_0;
    output wire [4*DATA_WIDTH-1:0] Output_1;
    output wire [4*DATA_WIDTH-1:0] Output_2;
    output wire [4*DATA_WIDTH-1:0] Output_3;

    wire [DATA_WIDTH-1:0]Input_act;

    ACT_PRE_PROCESS_UNIT act_pre_process_unit(
        .Input_act_data(Input_act_data),
        .mask(mask),
        .Output_act_data(Input_act)
    );

    MAC_UNIT mac_unit(
        .Input_act(Input_act),
        .Input_weight(Input_weight),
        .Block_control(Block_control),
        .Select(Select),
        .Clk(Clk),
        .rst(rst),
        .Output_0(Output_0),
        .Output_1(Output_1),
        .Output_2(Output_2),
        .Output_3(Output_3)
    );

endmodule
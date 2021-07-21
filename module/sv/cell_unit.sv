`timescale 1ns/100ps
module CELL_UNIT (Input_act_data,Input_weight,mask,Block_control,Direction,Control,ResultCapture,Clk,rst,
            Cell_Output_data_0,Cell_Output_data_1,Cell_Output_data_2,Cell_Output_data_3,
            ResultIn_0,ResultIn_1,ResultIn_2,ResultIn_3);

	parameter DATA_WIDTH = 8;
	parameter BLOCK_WIDTH = 4;
	parameter SELECT_WIDTH = 2;

    input logic	[BLOCK_WIDTH*BLOCK_WIDTH*DATA_WIDTH-1:0]Input_act_data;
	input logic [DATA_WIDTH-1:0]Input_weight;

    input logic [4*DATA_WIDTH-1:0]ResultIn_0;
    input logic [4*DATA_WIDTH-1:0]ResultIn_1;
    input logic [4*DATA_WIDTH-1:0]ResultIn_2;
    input logic [4*DATA_WIDTH-1:0]ResultIn_3;

    input logic [BLOCK_WIDTH-1:0]mask;

    input logic Block_control;
    input logic Direction;
    input logic Control;
    input logic ResultCapture;

    input logic Clk;
	input logic rst;

    output logic [4*DATA_WIDTH-1:0]Cell_Output_data_0;
    output logic [4*DATA_WIDTH-1:0]Cell_Output_data_1;
    output logic [4*DATA_WIDTH-1:0]Cell_Output_data_2;
    output logic [4*DATA_WIDTH-1:0]Cell_Output_data_3;

    logic [DATA_WIDTH-1:0]Input_act;
    logic [1:0]Select;

    logic [4*DATA_WIDTH-1:0] MAC_Output_0;
    logic [4*DATA_WIDTH-1:0] MAC_Output_1;
    logic [4*DATA_WIDTH-1:0] MAC_Output_2;
    logic [4*DATA_WIDTH-1:0] MAC_Output_3;

    logic [4*DATA_WIDTH-1:0]Result_Process_Output_0;
    logic [4*DATA_WIDTH-1:0]Result_Process_Output_1;
    logic [4*DATA_WIDTH-1:0]Result_Process_Output_2;
    logic [4*DATA_WIDTH-1:0]Result_Process_Output_3;

    ACT_PRE_PROCESS_UNIT act_pre_process_unit(
        .Input_act_data(Input_act_data),
        .mask(mask),
        .Output_act_data(Input_act)
    );

    CONTROL_UNIT control_unit(
        .Mask(mask),
        .Direction(Direction),
        .Select_signal(Select)
    );

    MAC_UNIT mac_unit(
        .Input_act(Input_act),
        .Input_weight(Input_weight),
        .Block_control(Block_control),
        .Select(Select),
        .Clk(Clk),
		.rst(rst),
        .Output_0(MAC_Output_0),
        .Output_1(MAC_Output_1),
        .Output_2(MAC_Output_2),
        .Output_3(MAC_Output_3)
    );

    RESULT_PROCESS result_process(
        .Input_data_0(MAC_Output_0),
        .Input_data_1(MAC_Output_1),
        .Input_data_2(MAC_Output_2),
        .Input_data_3(MAC_Output_3),
        .Control(Control),
        .Clk(Clk),
		.rst(rst),
        .Output_data_0(Result_Process_Output_0),
        .Output_data_1(Result_Process_Output_1),
        .Output_data_2(Result_Process_Output_2),
        .Output_data_3(Result_Process_Output_3)
    );

    RESULT_SELECT result_select(
        .Result_local_0(Result_Process_Output_0),
        .Result_local_1(Result_Process_Output_1),
        .Result_local_2(Result_Process_Output_2),
        .Result_local_3(Result_Process_Output_3),
        .ResultIn_0(ResultIn_0),
        .ResultIn_1(ResultIn_1),
        .ResultIn_2(ResultIn_2),
        .ResultIn_3(ResultIn_3),
        .Clk(Clk),
		.rst(rst),
        .ResultCapture(ResultCapture),
        .ResultOut_0(Cell_Output_data_0),
        .ResultOut_1(Cell_Output_data_1),
        .ResultOut_2(Cell_Output_data_2),
        .ResultOut_3(Cell_Output_data_3)
    );


endmodule
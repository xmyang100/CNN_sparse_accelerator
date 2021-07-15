`timescale 1ns/100ps

module Array_44 #(
	parameter DATA_WIDTH = 8,
	parameter BLOCK_SIZE = 4,
	parameter SELECT_WIDTH = 2,
	parameter ARRAY_SIZE = 4
	)(
	input [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act0,
	input [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act1,
	input [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act2,
	input [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0]Input_act3,
	
	input [DATA_WIDTH-1:0]Input_weight0,
	input [DATA_WIDTH-1:0]Input_weight1,
	input [DATA_WIDTH-1:0]Input_weight2,
	input [DATA_WIDTH-1:0]Input_weight3,
	
	
	input [4*DATA_WIDTH-1:0]Resultln0,
	input [4*DATA_WIDTH-1:0]Resultln1,
	input [4*DATA_WIDTH-1:0]Resultln2,
	input [4*DATA_WIDTH-1:0]Resultln3,
	input [4*DATA_WIDTH-1:0]Resultln4,
	input [4*DATA_WIDTH-1:0]Resultln5,
	input [4*DATA_WIDTH-1:0]Resultln6,
	input [4*DATA_WIDTH-1:0]Resultln7,
	input [4*DATA_WIDTH-1:0]Resultln8,
	input [4*DATA_WIDTH-1:0]Resultln9,
	input [4*DATA_WIDTH-1:0]Resultln10,
	input [4*DATA_WIDTH-1:0]Resultln11,
	input [4*DATA_WIDTH-1:0]Resultln12,
	input [4*DATA_WIDTH-1:0]Resultln13,
	input [4*DATA_WIDTH-1:0]Resultln14,
	input [4*DATA_WIDTH-1:0]Resultln15,
	
	input [3:0]mask0,
	input [3:0]mask1,
	input [3:0]mask2,
	input [3:0]mask3,
	input [3:0]mask4,
	input [3:0]mask5,
	input [3:0]mask6,
	input [3:0]mask7,
	input [3:0]mask8,
	input [3:0]mask9,
	input [3:0]mask10,
	input [3:0]mask11,
	input [3:0]mask12,
	input [3:0]mask13,
	input [3:0]mask14,
	input [3:0]mask15,
	
	input Block_control,
	input Direction,
	input Control,
	input ResultCapture,
	input Clk,
	input rst,
	output [4*DATA_WIDTH-1:0]Array_Output0,
	output [4*DATA_WIDTH-1:0]Array_Output1,
	output [4*DATA_WIDTH-1:0]Array_Output2,
	output [4*DATA_WIDTH-1:0]Array_Output3,
	output [4*DATA_WIDTH-1:0]Array_Output4,
	output [4*DATA_WIDTH-1:0]Array_Output5,
	output [4*DATA_WIDTH-1:0]Array_Output6,
	output [4*DATA_WIDTH-1:0]Array_Output7,
	output [4*DATA_WIDTH-1:0]Array_Output8,
	output [4*DATA_WIDTH-1:0]Array_Output9,
	output [4*DATA_WIDTH-1:0]Array_Output10,
	output [4*DATA_WIDTH-1:0]Array_Output11,
	output [4*DATA_WIDTH-1:0]Array_Output12,
	output [4*DATA_WIDTH-1:0]Array_Output13,
	output [4*DATA_WIDTH-1:0]Array_Output14,
	output [4*DATA_WIDTH-1:0]Array_Output15	
	);
	
	wire [4*DATA_WIDTH-1:0]Array_process[4*(BLOCK_SIZE-1)*BLOCK_SIZE-1:0];
	
	
	//The first column
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_00
	(
		.Input_act_data(Input_act0),
		.Input_weight(Input_weight0),
		.mask(mask0),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Resultln0),
		.ResultIn_1(Resultln1),
		.ResultIn_2(Resultln2),
		.ResultIn_3(Resultln3),
		.Cell_Output_data_0(Array_process[0]),
		.Cell_Output_data_1(Array_process[1]),
		.Cell_Output_data_2(Array_process[2]),
		.Cell_Output_data_3(Array_process[3])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_10
	(
		.Input_act_data(Input_act1),
		.Input_weight(Input_weight0),
		.mask(mask4),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[0]),
		.ResultIn_1(Array_process[1]),
		.ResultIn_2(Array_process[2]),
		.ResultIn_3(Array_process[3]),
		.Cell_Output_data_0(Array_process[16]),
		.Cell_Output_data_1(Array_process[17]),
		.Cell_Output_data_2(Array_process[18]),
		.Cell_Output_data_3(Array_process[19])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_20
	(
		.Input_act_data(Input_act2),
		.Input_weight(Input_weight0),
		.mask(mask8),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[16]),
		.ResultIn_1(Array_process[17]),
		.ResultIn_2(Array_process[18]),
		.ResultIn_3(Array_process[19]),
		.Cell_Output_data_0(Array_process[32]),
		.Cell_Output_data_1(Array_process[33]),
		.Cell_Output_data_2(Array_process[34]),
		.Cell_Output_data_3(Array_process[35])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_30
	(
		.Input_act_data(Input_act3),
		.Input_weight(Input_weight0),
		.mask(mask12),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[32]),
		.ResultIn_1(Array_process[33]),
		.ResultIn_2(Array_process[34]),
		.ResultIn_3(Array_process[35]),
		.Cell_Output_data_0(Array_Output0),
		.Cell_Output_data_1(Array_Output1),
		.Cell_Output_data_2(Array_Output2),
		.Cell_Output_data_3(Array_Output3)
	);
  
	//the second column
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_01
	(
		.Input_act_data(Input_act0),
		.Input_weight(Input_weight1),
		.mask(mask1),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Resultln4),
		.ResultIn_1(Resultln5),
		.ResultIn_2(Resultln6),
		.ResultIn_3(Resultln7),
		.Cell_Output_data_0(Array_process[4]),
		.Cell_Output_data_1(Array_process[5]),
		.Cell_Output_data_2(Array_process[6]),
		.Cell_Output_data_3(Array_process[7])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_11
	(
		.Input_act_data(Input_act1),
		.Input_weight(Input_weight1),
		.mask(mask5),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[4]),
		.ResultIn_1(Array_process[5]),
		.ResultIn_2(Array_process[6]),
		.ResultIn_3(Array_process[7]),
		.Cell_Output_data_0(Array_process[20]),
		.Cell_Output_data_1(Array_process[21]),
		.Cell_Output_data_2(Array_process[22]),
		.Cell_Output_data_3(Array_process[23])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_21
	(
		.Input_act_data(Input_act2),
		.Input_weight(Input_weight1),
		.mask(mask9),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[20]),
		.ResultIn_1(Array_process[21]),
		.ResultIn_2(Array_process[22]),
		.ResultIn_3(Array_process[23]),
		.Cell_Output_data_0(Array_process[36]),
		.Cell_Output_data_1(Array_process[37]),
		.Cell_Output_data_2(Array_process[38]),
		.Cell_Output_data_3(Array_process[39])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_31
	(
		.Input_act_data(Input_act3),
		.Input_weight(Input_weight1),
		.mask(mask13),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[36]),
		.ResultIn_1(Array_process[37]),
		.ResultIn_2(Array_process[38]),
		.ResultIn_3(Array_process[39]),
		.Cell_Output_data_0(Array_Output4),
		.Cell_Output_data_1(Array_Output5),
		.Cell_Output_data_2(Array_Output6),
		.Cell_Output_data_3(Array_Output7)
	);
  	
	//the third column
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_02
	(
		.Input_act_data(Input_act0),
		.Input_weight(Input_weight2),
		.mask(mask2),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Resultln8),
		.ResultIn_1(Resultln9),
		.ResultIn_2(Resultln10),
		.ResultIn_3(Resultln11),
		.Cell_Output_data_0(Array_process[8]),
		.Cell_Output_data_1(Array_process[9]),
		.Cell_Output_data_2(Array_process[10]),
		.Cell_Output_data_3(Array_process[11])
	);

	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_12
	(
		.Input_act_data(Input_act1),
		.Input_weight(Input_weight2),
		.mask(mask5),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[8]),
		.ResultIn_1(Array_process[9]),
		.ResultIn_2(Array_process[10]),
		.ResultIn_3(Array_process[11]),
		.Cell_Output_data_0(Array_process[24]),
		.Cell_Output_data_1(Array_process[25]),
		.Cell_Output_data_2(Array_process[26]),
		.Cell_Output_data_3(Array_process[27])
	);
  	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_22
	(
		.Input_act_data(Input_act2),
		.Input_weight(Input_weight2),
		.mask(mask10),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[24]),
		.ResultIn_1(Array_process[25]),
		.ResultIn_2(Array_process[26]),
		.ResultIn_3(Array_process[27]),
		.Cell_Output_data_0(Array_process[40]),
		.Cell_Output_data_1(Array_process[41]),
		.Cell_Output_data_2(Array_process[42]),
		.Cell_Output_data_3(Array_process[43])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_32
	(
		.Input_act_data(Input_act3),
		.Input_weight(Input_weight2),
		.mask(mask14),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[40]),
		.ResultIn_1(Array_process[41]),
		.ResultIn_2(Array_process[42]),
		.ResultIn_3(Array_process[43]),
		.Cell_Output_data_0(Array_Output8),
		.Cell_Output_data_1(Array_Output9),
		.Cell_Output_data_2(Array_Output10),
		.Cell_Output_data_3(Array_Output11)
	);
  	
	//the fouth column
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_03
	(
		.Input_act_data(Input_act0),
		.Input_weight(Input_weight3),
		.mask(mask3),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Resultln12),
		.ResultIn_1(Resultln13),
		.ResultIn_2(Resultln14),
		.ResultIn_3(Resultln15),
		.Cell_Output_data_0(Array_process[12]),
		.Cell_Output_data_1(Array_process[13]),
		.Cell_Output_data_2(Array_process[14]),
		.Cell_Output_data_3(Array_process[15])
	);

	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_13
	(
		.Input_act_data(Input_act1),
		.Input_weight(Input_weight3),
		.mask(mask7),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[12]),
		.ResultIn_1(Array_process[13]),
		.ResultIn_2(Array_process[14]),
		.ResultIn_3(Array_process[15]),
		.Cell_Output_data_0(Array_process[28]),
		.Cell_Output_data_1(Array_process[29]),
		.Cell_Output_data_2(Array_process[30]),
		.Cell_Output_data_3(Array_process[31])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_23
	(
		.Input_act_data(Input_act2),
		.Input_weight(Input_weight3),
		.mask(mask11),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[18]),
		.ResultIn_1(Array_process[29]),
		.ResultIn_2(Array_process[30]),
		.ResultIn_3(Array_process[31]),
		.Cell_Output_data_0(Array_process[44]),
		.Cell_Output_data_1(Array_process[45]),
		.Cell_Output_data_2(Array_process[46]),
		.Cell_Output_data_3(Array_process[47])
	);
	
	CELL_UNIT
	#(
		.DATA_WIDTH(DATA_WIDTH),
		.BLOCK_WIDTH(BLOCK_SIZE),
		.SELECT_WIDTH(SELECT_WIDTH)
	)
	Cell_unit_33
	(
		.Input_act_data(Input_act3),
		.Input_weight(Input_weight3),
		.mask(mask15),
		.Block_control(Block_control),
		.Direction(Direction),
		.Control(Control),
		.ResultCapture(ResultCapture),
		.Clk(Clk),
		.rst(rst),
		.ResultIn_0(Array_process[44]),
		.ResultIn_1(Array_process[45]),
		.ResultIn_2(Array_process[46]),
		.ResultIn_3(Array_process[47]),
		.Cell_Output_data_0(Array_Output12),
		.Cell_Output_data_1(Array_Output13),
		.Cell_Output_data_2(Array_Output14),
		.Cell_Output_data_3(Array_Output15)
	);
endmodule 
  	
	

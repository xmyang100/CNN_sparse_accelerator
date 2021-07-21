`timescale 1ns/100ps

module Array #(
	parameter BLOCK_SIZE = 4,
	parameter DATA_WIDTH = 8,
	parameter ARRAY_SIZE = 4,
	parameter SELECT_WIDTH = 2
	)(
	input logic [BLOCK_SIZE*BLOCK_SIZE*DATA_WIDTH-1:0] Input_act[ARRAY_SIZE-1:0],

	
	input logic [DATA_WIDTH-1 :0] Input_weight[ARRAY_SIZE-1:0],

	
	input logic [4*DATA_WIDTH-1:0]Resultln[BLOCK_SIZE*ARRAY_SIZE-1:0],

	
	input logic [3:0]mask[ARRAY_SIZE*ARRAY_SIZE-1:0],

	input logic Block_control,
	input logic Direction,
	input logic Control,
	input logic ResultCapture,
	input logic Clk,
	input logic rst,
	
	output logic [4*DATA_WIDTH-1:0]Array_Output[BLOCK_SIZE*ARRAY_SIZE-1:0]
	);
	
	logic [4*DATA_WIDTH-1:0]Array_process[BLOCK_SIZE*(ARRAY_SIZE-1)*ARRAY_SIZE-1:0];
	
	genvar i,j;
	
	generate
		for (i=0;i<ARRAY_SIZE;i++) begin:first_row
			CELL_UNIT
			#(
				.DATA_WIDTH(DATA_WIDTH),
				.BLOCK_WIDTH(BLOCK_SIZE),
				.SELECT_WIDTH(SELECT_WIDTH)
			)
			Cell_unit
			(
				.Input_act_data(Input_act[0]),
				.Input_weight(Input_weight[i]),
				.mask(mask[i]),
				.Block_control(Block_control),
				.Direction(Direction),
				.Control(Control),
				.ResultCapture(ResultCapture),
				.Clk(Clk),
				.rst(rst),
				.ResultIn_0(Resultln[BLOCK_SIZE*i]),
				.ResultIn_1(Resultln[BLOCK_SIZE*i+1]),
				.ResultIn_2(Resultln[BLOCK_SIZE*i+2]),
				.ResultIn_3(Resultln[BLOCK_SIZE*i+3]),
				.Cell_Output_data_0(Array_process[BLOCK_SIZE*i]),
				.Cell_Output_data_1(Array_process[BLOCK_SIZE*i+1]),
				.Cell_Output_data_2(Array_process[BLOCK_SIZE*i+2]),
				.Cell_Output_data_3(Array_process[BLOCK_SIZE*i+3])
			);
		end
		
		for (j=1;j<ARRAY_SIZE-1;j++)begin:middle_coloum
			for (i=0;i<ARRAY_SIZE;i++)begin:middle_row
				CELL_UNIT
				#(
					.DATA_WIDTH(DATA_WIDTH),
					.BLOCK_WIDTH(BLOCK_SIZE),
					.SELECT_WIDTH(SELECT_WIDTH)
				)
				Cell_unit
				(
					.Input_act_data(Input_act[j]),
					.Input_weight(Input_weight[i]),
					.mask(mask[ARRAY_SIZE*j+i]),
					.Block_control(Block_control),
					.Direction(Direction),
					.Control(Control),
					.ResultCapture(ResultCapture),
					.Clk(Clk),
					.rst(rst),
					.ResultIn_0(Array_process[BLOCK_SIZE*ARRAY_SIZE*(j-1)+BLOCK_SIZE*i]),
					.ResultIn_1(Array_process[BLOCK_SIZE*ARRAY_SIZE*(j-1)+BLOCK_SIZE*i+1]),
					.ResultIn_2(Array_process[BLOCK_SIZE*ARRAY_SIZE*(j-1)+BLOCK_SIZE*i+2]),
					.ResultIn_3(Array_process[BLOCK_SIZE*ARRAY_SIZE*(j-1)+BLOCK_SIZE*i+3]),
					.Cell_Output_data_0(Array_process[BLOCK_SIZE*ARRAY_SIZE*j+BLOCK_SIZE*i]),
					.Cell_Output_data_1(Array_process[BLOCK_SIZE*ARRAY_SIZE*j+BLOCK_SIZE*i+1]),
					.Cell_Output_data_2(Array_process[BLOCK_SIZE*ARRAY_SIZE*j+BLOCK_SIZE*i+2]),
					.Cell_Output_data_3(Array_process[BLOCK_SIZE*ARRAY_SIZE*j+BLOCK_SIZE*i+3])
				);
			end	
		end
		
		for (i=0;i<ARRAY_SIZE;i++) begin:last_row
			CELL_UNIT
			#(
				.DATA_WIDTH(DATA_WIDTH),
				.BLOCK_WIDTH(BLOCK_SIZE),
				.SELECT_WIDTH(SELECT_WIDTH)
			)
			Cell_unit
			(
				.Input_act_data(Input_act[ARRAY_SIZE-1]),
				.Input_weight(Input_weight[i]),
				.mask(mask[ARRAY_SIZE*(ARRAY_SIZE-1)+i]),
				.Block_control(Block_control),
				.Direction(Direction),
				.Control(Control),
				.ResultCapture(ResultCapture),
				.Clk(Clk),
				.rst(rst),
				.ResultIn_0(Array_process[BLOCK_SIZE*ARRAY_SIZE*(ARRAY_SIZE-2)+BLOCK_SIZE*i]),
				.ResultIn_1(Array_process[BLOCK_SIZE*ARRAY_SIZE*(ARRAY_SIZE-2)+BLOCK_SIZE*i+1]),
				.ResultIn_2(Array_process[BLOCK_SIZE*ARRAY_SIZE*(ARRAY_SIZE-2)+BLOCK_SIZE*i+2]),
				.ResultIn_3(Array_process[BLOCK_SIZE*ARRAY_SIZE*(ARRAY_SIZE-2)+BLOCK_SIZE*i+3]),
				.Cell_Output_data_0(Array_Output[BLOCK_SIZE*i]),
				.Cell_Output_data_1(Array_Output[BLOCK_SIZE*i+1]),
				.Cell_Output_data_2(Array_Output[BLOCK_SIZE*i+2]),
				.Cell_Output_data_3(Array_Output[BLOCK_SIZE*i+3])
			);
		end
	endgenerate
endmodule
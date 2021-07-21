`timescale 1ns/1ps

module ACT_PRE_PROCESS_UNIT(Input_act_data,mask,Output_act_data);

	parameter DATA_WIDTH = 8;
	parameter BLOCK_NUMBER = 16;
	
	input [BLOCK_NUMBER*DATA_WIDTH-1:0]Input_act_data;
	input [3:0]mask;
	
	output reg [DATA_WIDTH-1:0]Output_act_data;
	
	always @(Input_act_data,mask)
	begin
		case(mask)
		4'b0000:Output_act_data = Input_act_data[DATA_WIDTH*1-1:DATA_WIDTH*0];
		4'b0001:Output_act_data = Input_act_data[DATA_WIDTH*2-1:DATA_WIDTH*1];
		4'b0010:Output_act_data = Input_act_data[DATA_WIDTH*3-1:DATA_WIDTH*2];
		4'b0011:Output_act_data = Input_act_data[DATA_WIDTH*4-1:DATA_WIDTH*3];
		4'b0100:Output_act_data = Input_act_data[DATA_WIDTH*5-1:DATA_WIDTH*4];
		4'b0101:Output_act_data = Input_act_data[DATA_WIDTH*6-1:DATA_WIDTH*5];
		4'b0110:Output_act_data = Input_act_data[DATA_WIDTH*7-1:DATA_WIDTH*6];
		4'b0111:Output_act_data = Input_act_data[DATA_WIDTH*8-1:DATA_WIDTH*7];
		4'b1000:Output_act_data = Input_act_data[DATA_WIDTH*9-1:DATA_WIDTH*8];
		4'b1001:Output_act_data = Input_act_data[DATA_WIDTH*10-1:DATA_WIDTH*9];
		4'b1010:Output_act_data = Input_act_data[DATA_WIDTH*11-1:DATA_WIDTH*10];
		4'b1011:Output_act_data = Input_act_data[DATA_WIDTH*12-1:DATA_WIDTH*11];
		4'b1100:Output_act_data = Input_act_data[DATA_WIDTH*13-1:DATA_WIDTH*12];
		4'b1101:Output_act_data = Input_act_data[DATA_WIDTH*14-1:DATA_WIDTH*13];
		4'b1110:Output_act_data = Input_act_data[DATA_WIDTH*15-1:DATA_WIDTH*14];
		4'b1111:Output_act_data = Input_act_data[DATA_WIDTH*16-1:DATA_WIDTH*15];	
		endcase
	end
endmodule 
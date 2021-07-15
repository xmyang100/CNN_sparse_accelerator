`timescale 1ns/100ps
module RESULT_PROCESS(Input_data_0,Input_data_1,Input_data_2,Input_data_3,Control,Clk,rst,
				      Output_data_0,Output_data_1,Output_data_2,Output_data_3);
					  
	parameter DATA_WIDTH = 8;
	
	input [4*DATA_WIDTH-1:0]Input_data_0;
	input [4*DATA_WIDTH-1:0]Input_data_1;
	input [4*DATA_WIDTH-1:0]Input_data_2;
	input [4*DATA_WIDTH-1:0]Input_data_3;
	
	input Control;
	input Clk;
	input rst;
	
	output [4*DATA_WIDTH-1:0]Output_data_0;
	output [4*DATA_WIDTH-1:0]Output_data_1;
	output [4*DATA_WIDTH-1:0]Output_data_2;
	output [4*DATA_WIDTH-1:0]Output_data_3;
	
	RESULT_ACC result_acc_0(.Input_data(Input_data_0),.Control(Control),.Clk(Clk),.rst(rst),.Output_data(Output_data_0));
	RESULT_ACC result_acc_1(.Input_data(Input_data_1),.Control(Control),.Clk(Clk),.rst(rst),.Output_data(Output_data_1));
	RESULT_ACC result_acc_2(.Input_data(Input_data_2),.Control(Control),.Clk(Clk),.rst(rst),.Output_data(Output_data_2));
	RESULT_ACC result_acc_3(.Input_data(Input_data_3),.Control(Control),.Clk(Clk),.rst(rst),.Output_data(Output_data_3));
				  
endmodule

module RESULT_ACC(Input_data,Control,Clk,rst,Output_data);
	
	parameter DATA_WIDTH = 8;
	
	input [4*DATA_WIDTH-1:0] Input_data;
	
	input Control;
	input Clk;
	input rst;
	
	output reg [4*DATA_WIDTH-1:0]Output_data;
	
	reg [4*DATA_WIDTH-1:0]ACC_data;	
	wire [4*DATA_WIDTH-1:0]ACC_partial_data;
	reg [4*DATA_WIDTH-1:0]ACC_partial_OutputMUX_data;
	reg [4*DATA_WIDTH-1:0]ACC_partial_InputMUX_data;
	
	assign ACC_partial_data = ACC_data + Input_data;
	
	always@(posedge Clk)
	begin
		if(!rst)begin
			ACC_partial_InputMUX_data <= 0;
		end
		else begin
			ACC_partial_InputMUX_data <= ACC_partial_data;
		end
	end
	

	always @(ACC_partial_InputMUX_data,Control)
	begin
		if(Control == 0)
			Output_data = ACC_partial_InputMUX_data;
		else
			ACC_partial_OutputMUX_data = ACC_partial_InputMUX_data;
	end
	
	always @(ACC_partial_OutputMUX_data,Control)
	begin
	   if(Control == 1)
	       ACC_data = ACC_partial_OutputMUX_data;
	   else
	       ACC_data = 0;
	end
	
endmodule
`timescale 1ns/1ps

module RESULT_SELECT(Result_local_0,Result_local_1,Result_local_2,Result_local_3,
					 ResultIn_0,ResultIn_1,ResultIn_2,ResultIn_3,Clk,ResultCapture,rst,
					 ResultOut_0,ResultOut_1,ResultOut_2,ResultOut_3);
					 
	parameter DATA_WIDTH = 8;
	
	input [4*DATA_WIDTH-1:0] Result_local_0;
	input [4*DATA_WIDTH-1:0] Result_local_1;
	input [4*DATA_WIDTH-1:0] Result_local_2;
	input [4*DATA_WIDTH-1:0] Result_local_3;

	input [4*DATA_WIDTH-1:0] ResultIn_0;
	input [4*DATA_WIDTH-1:0] ResultIn_1;
	input [4*DATA_WIDTH-1:0] ResultIn_2;
	input [4*DATA_WIDTH-1:0] ResultIn_3;
	
	input Clk;
	input rst;
	input ResultCapture;
	
	output reg [4*DATA_WIDTH-1:0] ResultOut_0;
	output reg [4*DATA_WIDTH-1:0] ResultOut_1;
	output reg [4*DATA_WIDTH-1:0] ResultOut_2;
	output reg [4*DATA_WIDTH-1:0] ResultOut_3;
	
	reg [4*DATA_WIDTH-1:0]ResultOut_mux_0;
	reg [4*DATA_WIDTH-1:0]ResultOut_mux_1;
	reg [4*DATA_WIDTH-1:0]ResultOut_mux_2;
	reg [4*DATA_WIDTH-1:0]ResultOut_mux_3;
		
	always @(ResultCapture,Result_local_0,ResultIn_0)
	begin
		if(ResultCapture == 0)
			ResultOut_mux_0 = Result_local_0;
		else
			ResultOut_mux_0 = ResultIn_0;
	end
	
	always @(ResultCapture,Result_local_1,ResultIn_1)
	begin
		if(ResultCapture == 0)
			ResultOut_mux_1 = Result_local_1;
		else
			ResultOut_mux_1 = ResultIn_1;
	end
	
	always @(ResultCapture,Result_local_2,ResultIn_2)
	begin
		if(ResultCapture == 0)
			ResultOut_mux_2 = Result_local_2;
		else
			ResultOut_mux_2 = ResultIn_2;
	end
	
	always @(ResultCapture,Result_local_3,ResultIn_3)
	begin
		if(ResultCapture == 0)
			ResultOut_mux_3 = Result_local_3;
		else
			ResultOut_mux_3 = ResultIn_3;
	end
	
	always @(posedge Clk)
	begin
		if(!rst)begin
			ResultOut_0 <= 0;
			ResultOut_1 <= 0;
			ResultOut_2 <= 0;
			ResultOut_3 <= 0;
			
		end
		else begin
			ResultOut_0 <= ResultOut_mux_0;
			ResultOut_1 <= ResultOut_mux_1;
			ResultOut_2 <= ResultOut_mux_2;
			ResultOut_3 <= ResultOut_mux_3;	
		end
	end
	
endmodule
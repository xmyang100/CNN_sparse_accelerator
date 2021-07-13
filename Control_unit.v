`timescale 1ns/1ps
module CONTROL_UNIT(Mask,Direction,Select_signal);

	input [3:0]Mask;
	input Direction;
	
	output reg [1:0]Select_signal;
	
	always @(Direction,Mask)
	begin
		if(Direction == 0)
			//反向传播控制信号
			Select_signal = Mask[3:2];
		else 
		begin
			//前向传播控制信号
			Select_signal = Mask[1:0];
		end
	end
endmodule 
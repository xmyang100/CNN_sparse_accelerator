`timescale 1ns/100ps
module MAC_UNIT(Input_act,Input_weight,Block_control,Select,Clk,Output_0,Output_1,Output_2,Output_3,rst);
	
	parameter DATA_WIDTH = 8;
	parameter BLOCK_WIDTH = 4;
	parameter SELECT_WIDTH = 2;
	
	input [DATA_WIDTH-1:0]Input_act;
	input [DATA_WIDTH-1:0]Input_weight;
	
	input Block_control;
	input [SELECT_WIDTH-1:0] Select;
	
	input Clk;
	input rst;
	
	output reg [4*DATA_WIDTH-1:0] Output_0;
	output reg [4*DATA_WIDTH-1:0] Output_1;
	output reg [4*DATA_WIDTH-1:0] Output_2;
	output reg [4*DATA_WIDTH-1:0] Output_3;
	
	wire Block_control_out;
	
	wire [4*DATA_WIDTH-1:0]multi_result;
	wire [4*DATA_WIDTH-1:0]add_result;
	reg [4*DATA_WIDTH-1:0]output_mux;
	
	reg [4*DATA_WIDTH-1:0]Output_demux_0;
	reg [4*DATA_WIDTH-1:0]Output_demux_1;
	reg [4*DATA_WIDTH-1:0]Output_demux_2;
	reg [4*DATA_WIDTH-1:0]Output_demux_3;
	
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_0;
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_1;	
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_2;	
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_3;
	
    reg [4*DATA_WIDTH-1:0] Input_mux_0;
	reg [4*DATA_WIDTH-1:0] Input_mux_1;
	reg [4*DATA_WIDTH-1:0] Input_mux_2;
	reg [4*DATA_WIDTH-1:0] Input_mux_3;
	
	assign multi_result = Input_act*Input_weight;
	assign add_result = multi_result+output_mux;


	always@(posedge Clk)
	begin
		if(!rst)
		begin
			Output_partial_sum_0;
			Output_partial_sum_1;
			Output_partial_sum_2;
			Output_partial_sum_3;
		end
		else begin
			if(Select == 0) Output_partial_sum_0 <= add_result;
			else if(Select == 1) Output_partial_sum_1 <= add_result;
			else if(Select == 2) Output_partial_sum_2 <= add_result;
			else if(Select == 3) Output_partial_sum_3 <= add_result;
		end
	end

/*
	always@(add_result,Select)
	begin
		case(Select)
		2'b00: begin
		      Output_demux_0 = add_result;
			   Output_demux_1 = 0;
			   Output_demux_2 = 0;
			   Output_demux_3 = 0;
			   end
		2'b01: begin
		       Output_demux_1 = add_result;
			   Output_demux_0 = 0;
			   Output_demux_2 = 0;
			   Output_demux_3 = 0;
			   end
		2'b10: begin
		       Output_demux_2 = add_result;
			   Output_demux_0 = 0;
			   Output_demux_1 = 0;
			   Output_demux_3 = 0;
			   end
		2'b11: begin
		       Output_demux_3 = add_result;
			   Output_demux_0 = 0;
			   Output_demux_1 = 0;
			   Output_demux_2 = 0;
			   end
		endcase
	end
*/
	always@(posedge Clk)
	begin
		Output_partial_sum_0 <= Output_demux_0;
		Output_partial_sum_1 <= Output_demux_1;
		Output_partial_sum_2 <= Output_demux_2;
		Output_partial_sum_3 <= Output_demux_3;	
	end

    always @(Block_control,Output_partial_sum_0)
    begin
        if(Block_control == 1)
            Input_mux_0 = Output_partial_sum_0;
        else
            Input_mux_0 = 0;    
    end
    
    always @(Block_control,Output_partial_sum_1)
    begin
        if(Block_control == 1)
            Input_mux_1 = Output_partial_sum_1;
        else
            Input_mux_1 = 0;    
    end
    
    always @(Block_control,Output_partial_sum_2)
    begin
        if(Block_control == 1)
            Input_mux_2 = Output_partial_sum_2;
        else
            Input_mux_2 = 0;    
    end
     
    always @(Block_control,Output_partial_sum_3)
    begin
        if(Block_control == 1)
            Input_mux_3 = Output_partial_sum_3;
        else
            Input_mux_3 = 0;    
    end
	
	
	
	assign Block_control_out = ~Block_control;

	always @(Block_control_out,Output_partial_sum_0)
	begin
		if(Block_control_out == 1)
			Output_0 = Output_partial_sum_0;
		else
			Output_0 = 0;
	end

	always @(Block_control_out,Output_partial_sum_1)
	begin
		if(Block_control_out == 1)
			Output_1 = Output_partial_sum_1;
		else
			Output_1 = 0;
	end

	always @(Block_control_out,Output_partial_sum_2)
	begin
		if(Block_control_out == 1)
			Output_2 = Output_partial_sum_2;
		else
			Output_2 = 0;
	end

	always @(Block_control_out,Output_partial_sum_3)
	begin
		if(Block_control_out == 1)
			Output_3= Output_partial_sum_3;
		else
			Output_3 = 0;
	end

	always @(Select,Input_mux_0,Input_mux_1,Input_mux_2,Input_mux_3)
	begin
		case(Select)
			2'b00: begin
				   output_mux = Input_mux_0;
				   end
			2'b01: begin
				   output_mux = Input_mux_1;
				   end
			2'b10: begin
				   output_mux = Input_mux_2;
				   end
			2'b11: begin
				   output_mux = Input_mux_3;
				   end
		endcase
	end

endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
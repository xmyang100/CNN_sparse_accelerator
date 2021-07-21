`timescale 1ns/100ps
module MAC_UNIT(Input_act,Input_weight,Block_control,Select,Clk,Output_0,Output_1,Output_2,Output_3,rst);
	
	parameter DATA_WIDTH = 8;
	parameter BLOCK_WIDTH = 4;
	parameter SELECT_WIDTH = 2;
	
	input logic [DATA_WIDTH-1:0]Input_act;
	input logic [DATA_WIDTH-1:0]Input_weight;
	
	input logic Block_control;
	input logic [SELECT_WIDTH-1:0] Select;
	
	input logic Clk;
	input logic rst;
	
	output logic [4*DATA_WIDTH-1:0] Output_0;
	output logic [4*DATA_WIDTH-1:0] Output_1;
	output logic [4*DATA_WIDTH-1:0] Output_2;
	output logic [4*DATA_WIDTH-1:0] Output_3;
	
	logic Block_control_out;
	logic [SELECT_WIDTH-1:0] Select_in;
	
	logic [4*DATA_WIDTH-1:0]multi_result;
	logic [4*DATA_WIDTH-1:0]add_result;
	logic [4*DATA_WIDTH-1:0]output_mux;
/*	
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_0;
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_1;	
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_2;	
	reg [4*DATA_WIDTH-1:0] Output_partial_sum_3;


	reg [4*DATA_WIDTH-1:0] Input_reg_0;
	reg [4*DATA_WIDTH-1:0] Input_reg_1;
	reg [4*DATA_WIDTH-1:0] Input_reg_2;
	reg [4*DATA_WIDTH-1:0] Input_reg_3;
*/
	
    logic [4*DATA_WIDTH-1:0] Input_mux_0;
	logic [4*DATA_WIDTH-1:0] Input_mux_1;
	logic [4*DATA_WIDTH-1:0] Input_mux_2;
	logic [4*DATA_WIDTH-1:0] Input_mux_3;
	
	//reg [SELECT_WIDTH-1:0] Select_demux;
	
	assign multi_result = Input_act*Input_weight;
	assign add_result = multi_result+output_mux;
	
	always @(posedge Clk)
	begin
	   Select_in <= Select;
	end
	

/*
	always@(posedge Clk)
	begin
		if(rst == 0)
		begin
			Output_partial_sum_0 <= 32'b0;
			Output_partial_sum_1 <= 32'b0;
			Output_partial_sum_2 <= 32'b0;
			Output_partial_sum_3 <= 32'b0;
		end
	
		else begin
			if(Select == 0) 
			begin
				Output_partial_sum_0 <= add_result;
			end
			else if(Select == 1) 
			begin
				Output_partial_sum_1 <= add_result;
			end
			else if(Select == 2) 
			begin
				Output_partial_sum_2 <= add_result;
			end
			else if(Select == 3) 
			begin
				Output_partial_sum_3 <= add_result;
			end
		end	
	end
*/

/*	
	always@(posedge Clk)
	begin
		if(Select == 0) 
		begin
			if(Block_control == 1)
			begin
				Input_mux_0 <= add_result;
			end
			else
				Input_mux_0 <=0;
		end
		else if(Select == 1) 
		begin
			Output_partial_sum_1 = add_result;
		end
		else if(Select == 2) 
		begin
			Output_partial_sum_2 = add_result;
		end
		else if(Select == 3) 
		begin
			Output_partial_sum_3 = add_result;
		end
	end
*/
	always@(posedge Clk)
	begin
		if(!rst)
		begin
			Input_mux_0 <= 0;
			Input_mux_1 <= 0;
			Input_mux_2 <= 0;
			Input_mux_3 <= 0;
		end
		else if(rst == 1)
	    begin
			if(Block_control == 1)
			begin
				if(Select_in == 0)
				begin
					Input_mux_0 <= add_result;
				end
				else if(Select_in == 1) 
				begin
					Input_mux_1 <= add_result;
				end
				else if(Select_in == 2)
				begin
					Input_mux_2 <= add_result;
				end
				else if(Select_in == 3)
				begin
					Input_mux_3 <= add_result;
				end
			end
			else if(Block_control == 0)
			begin
				Input_mux_0 <= 0;
				Input_mux_1 <= 0;
				Input_mux_2 <= 0;
				Input_mux_3 <= 0;
			end
		end
	end
	
/*	
    always @(*)
    begin
        if(Block_control == 1)
            Input_reg_0 = Output_partial_sum_0;
        else
            Input_reg_0 = 0;    
    end
    
    always @(*)
    begin
        if(Block_control == 1)
            Input_reg_1 = Output_partial_sum_1;
        else
            Input_reg_1 = 0;    
    end
    
    always @(*)
    begin
        if(Block_control == 1)
            Input_reg_2 = Output_partial_sum_2;
        else
            Input_reg_2 = 0;    
    end
     
    always @(*)
    begin
        if(Block_control == 1)
            Input_reg_3 = Output_partial_sum_3;
        else
            Input_reg_3 = 0;    
    end
	
	always@(posedge Clk)
	begin
		if(!rst)
		begin
			Input_mux_0 <= 0;
			Input_mux_1 <= 0;
			Input_mux_2 <= 0;
			Input_mux_3 <= 0;
		end
		else
		begin
			Input_mux_0 <= Input_reg_0;
			Input_mux_1 <= Input_reg_1;
			Input_mux_2 <= Input_reg_2;
			Input_mux_3 <= Input_reg_3;		
		end
	end
*/
	
	always @(*)
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

	assign Block_control_out = ~Block_control;

	always @(*)
	begin
		if(Block_control_out == 1)
			Output_0 = Input_mux_0;
		else
			Output_0 = 0;
	end

	always @(*)
	begin
		if(Block_control_out == 1)
			Output_1 = Input_mux_1;
		else
			Output_1 = 0;
	end

	always @(*)
	begin
		if(Block_control_out == 1)
			Output_2 = Input_mux_2;
		else
			Output_2 = 0;
	end

	always @(*)
	begin
		if(Block_control_out == 1)
			Output_3= Input_mux_3;
		else
			Output_3 = 0;
	end


endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
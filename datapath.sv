module datapath( 	input logic Clk, Reset_ah, LD_MDR, LD_MAR, LD_IR, LD_PC, LD_REG, LD_BEN, LD_CC, GateMARMUX, GatePC, GateMDR, GateALU,
									DRMUX,
									SR1MUX,
									SR2MUX,
									ADDR1MUX,
						input logic [1:0] PCMUX, ALUK, ADDR2MUX,				
					   input logic OE,
					   input logic [15:0] MDR_In,
						output logic [15:0] datapath_output_IR,
						output logic [15:0] MAR, MDRreg_output,
					   output logic [15:0] PC,
						output logic BEN
					  );
					  
//BUS output declare here
//PC mux and register
//TO DO: PCmux_input123 need to be wired up in CP2
logic [15:0] bus_data, PCmux_input123, PC_mux_output, PC_reg_output, PCmux_input0, IR_output, SR1_output, SR2_output, SR2MUX_output, ALU_ADDR_output, SEXT_output;
logic [2:0] DRMUX_output, SR1MUX_output, SR2;
logic [15:0] GateMARMUX_input_temp, GateALU_input;
assign PCmux_input0 = PC_reg_output + 16'h0001;
assign datapath_output_IR = IR_output;
assign SR2 = IR_output[2:0];
assign PC = PC_reg_output;

//PC
four_one_mux PC_mux(.select(PCMUX), .input0(PCmux_input0), .input1(ALU_ADDR_output), .input2(bus_data), .input3(16'h0000), .output_mux(PC_mux_output));
register_pc PC_register(.Clk(Clk), .reset(Reset_ah), .load(LD_PC), .data_in(PC_mux_output), .data_out(PC_reg_output));


//MAR 
register MAR_register(.Clk(Clk), .reset(Reset_ah), .load(LD_MAR), .data_in(bus_data), .data_out(MAR)); 


//MDR
logic [15:0] MDRmux_output;
two_one_mux MDR_mux(.select(OE), .input0(MDR_In), .input1(bus_data), .output_mux(MDRmux_output));
register MDR_register(.Clk(Clk), .reset(Reset_ah), .load(LD_MDR), .data_in(MDRmux_output), .data_out(MDRreg_output));


//IR
register IR_module(.Clk(Clk), .reset(Reset_ah), .load(LD_IR), .data_in(bus_data), .data_out(IR_output));


//REG_FILE
two_one_mux SR2_MUX(.select(SR2MUX), .input1(SEXT_output), .input0(SR2_output), .output_mux(SR2MUX_output));
two_one_mux_3bit SR1_MUX(.select(SR1MUX), .input1(IR_output[11:9]), .input0(IR_output[8:6]), .output_mux(SR1MUX_output));
two_one_mux_3bit DR_MUX(.select(DRMUX), .input1(3'b111), .input0(IR_output[11:9]), .output_mux(DRMUX_output));
reg_file REG_FILE(.*, .data_in(bus_data));


//ALU
ALU alu(.*, .ALU_compute_output(GateALU_input));

//ALU_address
ALU_address alu_address(.*);


//BEN
ben ben_module(.*, .reset(Reset_ah), .IR_11_9(IR_output[11:9]), .ben_input(bus_data), .ben_output(BEN));


//BUS
bus BUS(.GateMARMUX(GateMARMUX), .GatePC(GatePC), .GateMDR(GateMDR), .GateALU(GateALU), .GateMARMUX_input(ALU_ADDR_output), .GatePC_input(PC_reg_output), .GateMDR_input(MDRreg_output), .GateALU_input(GateALU_input), .bus_output(bus_data));

endmodule



module register_pc(input logic Clk,
				 input logic reset,
				 input logic load,
             input logic [15:0]  data_in,
				 output logic [15:0]  data_out);

	
always_ff @ (posedge Clk)
begin 

	if(reset == 1'b1)
	   data_out <= 16'h0000;
	else if(load == 1'b1)
		data_out <= data_in;

end
endmodule

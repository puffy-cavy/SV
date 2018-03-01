//BUS 
module bus(input logic GateMARMUX,
							  GatePC,
							  GateMDR,
							  GateALU,
				input logic[15:0] GateMARMUX_input,
									   GatePC_input,
									   GateMDR_input,
									   GateALU_input,
				output logic[15:0] bus_output
		);
	always_comb
		begin
			if(GateMARMUX == 1'b1)
				bus_output = GateMARMUX_input;
			else if(GatePC == 1'b1)
				bus_output = GatePC_input;
			else if(GateMDR == 1'b1)
				bus_output = GateMDR_input;
			else if(GateALU == 1'b1)
				bus_output = GateALU_input;
			else
				bus_output = 16'd0;
		end
endmodule

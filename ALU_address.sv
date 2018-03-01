module ALU_address(input logic[15:0] IR_output, PC_reg_output, SR1_output,
						 input logic[1:0] ADDR2MUX, 
						 input logic ADDR1MUX,
						 output logic[15:0] ALU_ADDR_output, SEXT_output
						 );
						 
		logic [15:0] sext_0, sext_1, sext_2, sext_3, sext_4, addr2_mux_output, addr1_mux_output;
		assign sext_0 = 16'h0000;
		assign sext_1 = {{10{IR_output[5]}}, IR_output[5:0]};
		assign sext_2 = {{7{IR_output[8]}}, IR_output[8:0]};
		assign sext_3 = {{5{IR_output[10]}}, IR_output[10:0]};
		assign sext_4 = {{11{IR_output[4]}}, IR_output[4:0]};

		four_one_mux addr_2_mux(.select(ADDR2MUX), .input0(sext_0), .input1(sext_1), .input2(sext_2), .input3(sext_3), .output_mux(addr2_mux_output));
		two_one_mux addr_1_mux(.select(ADDR1MUX), .input0(PC_reg_output), .input1(SR1_output), .output_mux(addr1_mux_output));
		
		assign ALU_ADDR_output = addr2_mux_output + addr1_mux_output;
		assign SEXT_output = sext_4;
						 
endmodule 






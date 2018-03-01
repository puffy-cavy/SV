//ALU
module ALU(input logic[15:0] SR1_output,
						 input logic[15:0] SR2MUX_output,
						 input logic[1:0] ALUK,
						 output logic[15:0] ALU_compute_output);
			
	always_comb
		begin 
			case (ALUK)
				2'b00 : //add
					ALU_compute_output = SR1_output + SR2MUX_output;
				2'b01 : //and
					ALU_compute_output = SR1_output & SR2MUX_output;
				2'b10 : //or
					ALU_compute_output = SR1_output | SR2MUX_output;
				2'b11 : //direct SR1
					ALU_compute_output = ~SR1_output;
				default:
					ALU_compute_output = SR1_output;
			endcase
		end

endmodule

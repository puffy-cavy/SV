module two_one_mux_3bit(input logic select,
						  input logic [2:0] input0,
						  input logic [2:0] input1,
						  output logic [2:0] output_mux);
		always_comb
		begin
			unique case(select)
				1'b0:
					output_mux = input0;
				1'b1:
				   output_mux = input1;
				default : ;
			endcase
		end
endmodule

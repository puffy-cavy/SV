module four_one_mux(input logic [1:0] select,
						  input logic [15:0] input0,
						  input logic [15:0] input1,
						  input logic [15:0] input2,
						  input logic [15:0] input3,
						  output logic [15:0] output_mux
);
		always_comb
		begin
			unique case(select)
				2'b00:
					output_mux = input0;
				2'b01:
				   output_mux = input1;
				2'b10:
				   output_mux = input2;
				2'b11:
				   output_mux = input3;
				default : ;
			endcase
		end
endmodule

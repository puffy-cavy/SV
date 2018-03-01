//Reg_file
module reg_file(	 input logic Clk,
						 input logic[15:0] data_in,
						 input logic[2:0] DRMUX_output,
						 input logic[2:0] SR1MUX_output,
						 input logic[2:0] SR2,
						 input logic LD_REG,
						 output logic[15:0] SR1_output,
						 output logic[15:0] SR2_output);
//R0 - R7 The real register is located here
logic [15:0] R[0:7];


//SR1 & SR2
assign SR1_output = R[SR1MUX_output];
assign SR2_output = R[SR2];

//DR
always_ff @ (posedge Clk)
	begin
		if(LD_REG == 1'b1)
			R[DRMUX_output]<= data_in;
	end
						 
endmodule

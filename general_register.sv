module register(input logic Clk,
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

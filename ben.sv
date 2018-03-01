module ben(input logic Clk,
			              reset,
							  LD_BEN,
							  LD_CC,
			  input logic[2:0] IR_11_9,
			  input logic[15:0] ben_input,
			  output logic ben_output
			  );
			  
logic [2:0] logic_low_output;
logic [2:0] nzp;
logic	logic_up_output;	  
			  
logic_low logic_low_module(.*);
nzp nzp_module(.*);
logic_up logic_up_module(.*);
ben_register ben_register_module(.*, .data_in(logic_up_output));
			  
endmodule
			  
			  
module logic_low(input logic [15:0] ben_input,
					  output logic [2:0] logic_low_output
						);
//set destination register
		always_comb
		    begin
				if(ben_input[15] == 1'b1)
					logic_low_output = 3'b100;//set NZP = 100
				else if(ben_input == 16'h0000)
					logic_low_output = 3'b010;//set NZP = 010
				else
					logic_low_output = 3'b001;//set NZP = 001
			 end
			 
endmodule

module nzp( input logic Clk, 
								reset, 
								LD_CC,
				input logic[2:0] logic_low_output,
				output logic[2:0] nzp
				);
	always_ff @ (posedge Clk)
		begin
			if(reset == 1'b1)
				nzp <= 3'b0;
			else if(LD_CC)
				nzp <= logic_low_output;
		end
endmodule

module logic_up(input logic[2:0] nzp,
					 input logic[2:0] IR_11_9,
					 output logic logic_up_output

);
	always_comb
		begin
			logic_up_output = (nzp[2]&IR_11_9[2])|(nzp[1]&IR_11_9[1] | (nzp[0]&IR_11_9[0]));
		end
endmodule

			  
module ben_register(input logic Clk,
				 input logic reset,
				 input logic LD_BEN,
             input logic data_in,
				 output logic ben_output);
			
always_ff @ (posedge Clk)
begin 
	if(reset == 1'b1)
	   ben_output <= 1'b0;
	else if(LD_BEN == 1'b1)
		ben_output <= data_in;

end
endmodule

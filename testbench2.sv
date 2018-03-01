//tenchbench
module testbench2();

timeunit 10ns;

timeprecision 1ns;

logic 			Clk;
logic				reset;
logic 			load;
logic				LD_BEN;
logic 			ADDR1MUX;
logic[1:0] ADDR2MUX;
logic[15:0] IR_output, PC_reg_output, SR1_output, ALU_ADDR_output, SEXT_output;
						 
always begin: CLOCK_GENERATION

#1 Clk = ~Clk;

end


initial begin : CLOCK_INITIALIZATION 
	Clk = 0;	
end

ALU_address test(.*);


initial begin: TEST_VECTORS

IR_output = 16'h0000;
PC_reg_output = 16'h0000;
SR1_output = 16'h0000;
ADDR2MUX = 2'b00;
ADDR1MUX = 1'b0;

#2
IR_output = 16'h0001;
PC_reg_output = 16'h0000;
SR1_output = 16'h0000;
ADDR2MUX = 2'b01;
ADDR1MUX = 1'b0;

#2
IR_output = 16'hffff;
PC_reg_output = 16'h0000;
SR1_output = 16'h0000;
ADDR2MUX = 2'b01;
ADDR1MUX = 1'b0;

#2
IR_output = 16'b0000111010011000;
PC_reg_output = 16'h0000;
SR1_output = 16'h0000;
ADDR2MUX = 2'b01;
ADDR1MUX = 1'b0;

#2
ADDR2MUX = 2'b00;

#2
ADDR2MUX = 2'b01;

#2
ADDR2MUX = 2'b10;

#2
ADDR2MUX = 2'b11;

#2
ADDR2MUX = 2'b01;
ADDR1MUX = 2'b1;
SR1_output = 16'h0010;

#2
ADDR1MUX = 2'b0;
PC_reg_output = 16'h0001;


end

endmodule



//tenchbench
module testbench();

timeunit 10ns;

timeprecision 1ns;

logic 			Clk;
logic				Reset;
logic 			Run;
logic				Continue;
logic[15:0]		S;
logic[15:0]  I_O;

logic[11:0] LED;
logic[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
logic CE, UB, LB, OE, WE;
logic [19:0] ADDR;
wire [15:0] Data;

always begin: CLOCK_GENERATION

#1 Clk = ~Clk;

end


initial begin : CLOCK_INITIALIZATION 
	Clk = 0;	
end

							 
lab6_toplevel tp(.*);

// MONITOR
logic [15:0] test_ir, test_pc, test_mar, test_mdr;
logic [15:0] test_r0, test_r1, test_r2, test_r3, test_r4, test_r5, test_r6, test_r7;
logic [4:0] test_state;
logic test_ben;
 
always @ *
begin:INITERAL_SIG_MONITOR
test_ir = tp.my_slc.IR;
test_pc = tp.my_slc.PC;
test_state = tp.my_slc.state_controller.State;

test_mar = tp.my_slc.MAR;
test_mdr = tp.my_slc.MDR;

test_r0 = tp.my_slc.d0.REG_FILE.R[0];
test_r1 = tp.my_slc.d0.REG_FILE.R[1];
test_r2 = tp.my_slc.d0.REG_FILE.R[2];
test_r3 = tp.my_slc.d0.REG_FILE.R[3];
test_r4 = tp.my_slc.d0.REG_FILE.R[4];
test_r5 = tp.my_slc.d0.REG_FILE.R[5];
test_r6 = tp.my_slc.d0.REG_FILE.R[6];
test_r7 = tp.my_slc.d0.REG_FILE.R[7];

test_ben = tp.my_slc.d0.ben_module.ben_output;
end

initial begin
	tp.my_slc.d0.REG_FILE.R[0] = 16'h0000;
	tp.my_slc.d0.REG_FILE.R[1] = 16'h0000;
	tp.my_slc.d0.REG_FILE.R[2] = 16'h0000;
	tp.my_slc.d0.REG_FILE.R[3] = 16'h0000;
	tp.my_slc.d0.REG_FILE.R[4] = 16'h0000;
	tp.my_slc.d0.REG_FILE.R[5] = 16'h0000;
	tp.my_slc.d0.REG_FILE.R[6] = 16'h0000;
	tp.my_slc.d0.REG_FILE.R[7] = 16'h0000;
end


// o eng 1 buen
initial begin: TEST_VECTORS
S = 16'h0003;
Reset = 1;
//testcase 1
Continue = 1;
Run = 1;

//press reset
#2 Reset = 0;
#2 Reset = 1;

//press run 	
#2 Run = 0;
#2 Run = 1;
//first three
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

//next three;
#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;

#30 Continue = 0;
#2 Continue = 1;


end

endmodule

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/synchronizer.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/HexDriver.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/tristate.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/Mem2IO.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/ISDU.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/bus.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/reg_file.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/ALU.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/general_register.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/four_one_mux.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/two_one_mux.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/ben.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/two_one_mux_3bit.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/ALU_address.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/datapath.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/slc3.sv}
vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/lab6_toplevel.sv}

vlog -sv -work work +incdir+U:/LAB6\ _2 {U:/LAB6 _2/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 500 ns

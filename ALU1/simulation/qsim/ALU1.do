onerror {quit -f}
vlib work
vlog -work work ALU1.vo
vlog -work work ALU1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.latch1_vlg_vec_tst
vcd file -direction ALU1.msim.vcd
vcd add -internal latch1_vlg_vec_tst/*
vcd add -internal latch1_vlg_vec_tst/i1/*
add wave /*
run -all

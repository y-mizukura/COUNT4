quit -sim
cd c:/temp/Quartus/Verilog-HDL/COUNT4
vlib work
vlog -reportprogress 300 -work work C:/Temp/Quartus/Verilog-HDL/COUNT4/COUNT4.v
vlog -reportprogress 300 -work work C:/Temp/Quartus/Verilog-HDL/COUNT4/T_COUNT4.v
vsim -gui work.T_COUNT4
add wave -position insertpoint  \
sim:/T_COUNT4/SIM_SEC1_MAX \
sim:/T_COUNT4/CYCLE \
sim:/T_COUNT4/CLK \
sim:/T_COUNT4/RESET \
sim:/T_COUNT4/i0/ENABLE
add wave -position insertpoint -radix hex \
sim:/T_COUNT4/COUNT
add wave -position insertpoint -radix decimal \
sim:/T_COUNT4/i0/tmp_count
run -all


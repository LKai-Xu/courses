set top "fused_signed_mac_32p8t8_2x24p8t4_ref"

set search_path 	"../lib"
set target_library	"saed32rvt_ss0p95v125c.db sram_8kx32_ss_0p99v_0p99v_125c.db"
set link_library    "* $target_library"

set_svf -off

analyze -format sverilog -vcs [glob -nocomplain -directory ../rtl/ *.v]
elaborate $top
current_design $top
check_design

link

set CLK_PERIOD  [expr 1000.00/100.00]
# create_clock -period $CLK_PERIOD -name vclk
# set_input_delay 0.0 -clock vclk [all_inputs]
# set_output_delay 0.0 -clock vclk [all_outputs]
create_clock -period $CLK_PERIOD [get_ports clk]
set_input_delay 0.0 -clock clk [all_inputs]
set_output_delay 0.0 -clock clk [all_outputs]

set_max_area 0

compile_ultra

report_area -hierarchy > ../outputs/$top.area.rpts
report_power > ../outputs/$top.power.rpts
report_timing > ../outputs/$top.timing.rpts

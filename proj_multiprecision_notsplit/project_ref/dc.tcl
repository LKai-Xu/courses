set top "accelerator"

set search_path 	". /opt/ic_libs/saed32/dc"
set target_library	"saed32rvt_ss0p95v125c.db sram_8kx32_ss_0p99v_0p99v_125c.db"
set link_library    "* $target_library"

set_svf -off

analyze -format sverilog -vcs [glob -nocomplain -directory ../rtl/ *.v]
elaborate $top
current_design $top
check_design

link

set CLK_PERIOD  [expr 1000.00/100.00]
create_clock -period $CLK_PERIOD [get_ports clk]
set_input_delay 0.0 -clock clk [all_inputs]
set_output_delay 0.0 -clock clk [all_outputs]

set_max_area 0

compile
# compile_ultra

report_area -hierarchy > ../out/$top.area.rpts
report_power > ../out/$top.power.rpts
report_timing > ../out/$top.timing.rpts

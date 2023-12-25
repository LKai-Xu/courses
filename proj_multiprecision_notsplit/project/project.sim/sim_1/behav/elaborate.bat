@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto b888fec1c0314752a5b0968ee6d44156 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot top_tb_behav xil_defaultlib.top_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

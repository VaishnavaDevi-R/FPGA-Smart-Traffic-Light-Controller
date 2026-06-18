@echo off

echo =====================================
echo Compiling FPGA Traffic Controller
echo =====================================

C:\iverilog\bin\iverilog.exe -g2012 -o traffic.out rtl\traffic_fsm.sv tb\traffic_tb.sv

pause
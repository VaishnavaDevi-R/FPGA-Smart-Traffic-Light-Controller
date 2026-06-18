@echo off

echo =====================================
echo Compile
echo =====================================

C:\iverilog\bin\iverilog.exe -g2012 -o traffic.out rtl\traffic_fsm.sv tb\traffic_tb.sv

echo =====================================
echo Simulate
echo =====================================

C:\iverilog\bin\vvp.exe traffic.out

echo =====================================
echo Finished
echo =====================================

pause
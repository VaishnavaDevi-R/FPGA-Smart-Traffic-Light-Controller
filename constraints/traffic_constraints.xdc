###############################################################################
# FPGA Smart Traffic Light Controller
# Example XDC Constraints File
###############################################################################

## Clock Input
#set_property PACKAGE_PIN W5 [get_ports clk]
#set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset Button
#set_property PACKAGE_PIN U18 [get_ports rst]
#set_property IOSTANDARD LVCMOS33 [get_ports rst]

## North-South Signals
#set_property PACKAGE_PIN V17 [get_ports NS_G]
#set_property PACKAGE_PIN V16 [get_ports NS_Y]
#set_property PACKAGE_PIN W16 [get_ports NS_R]

## East-West Signals
#set_property PACKAGE_PIN W17 [get_ports EW_G]
#set_property PACKAGE_PIN W15 [get_ports EW_Y]
#set_property PACKAGE_PIN V15 [get_ports EW_R]

## Pedestrian Button
#set_property PACKAGE_PIN U16 [get_ports ped_button]

## Emergency Input
#set_property PACKAGE_PIN U17 [get_ports emergency]
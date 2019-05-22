set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]


set_property IOSTANDARD LVCMOS33 [get_ports {display[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_c[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_c[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_c[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_c[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports clk_crystal]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN W5 [get_ports clk_crystal]
set_property PACKAGE_PIN V17 [get_ports rst]
set_property PACKAGE_PIN W7 [get_ports {display[7]}]
set_property PACKAGE_PIN W6 [get_ports {display[6]}]
set_property PACKAGE_PIN U8 [get_ports {display[5]}]
set_property PACKAGE_PIN V8 [get_ports {display[4]}]
set_property PACKAGE_PIN U5 [get_ports {display[3]}]
set_property PACKAGE_PIN V5 [get_ports {display[2]}]
set_property PACKAGE_PIN U7 [get_ports {display[1]}]
set_property PACKAGE_PIN V7 [get_ports {display[0]}]

set_property PACKAGE_PIN U2 [get_ports {display_c[0]}]

set_property PACKAGE_PIN U4 [get_ports {display_c[1]}]



set_property PACKAGE_PIN V4 [get_ports {display_c[2]}]
set_property PACKAGE_PIN W4 [get_ports {display_c[3]}]
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/20 18:58:16
// Design Name: 
// Module Name: Lab04_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab04_3(
     clk_crystal,
     display_c,
     display,
     rst
    );
    input clk_crystal;
    input rst;
    output [3:0] display_c;
    output [7:0] display;
    
    wire clk_d;
    wire [1:0] ssd_ctl_en;
    
    freq_div FD(
    .clk_in(clk_crystal),
    //.rst(rst),
    .clk_out(clk_d),
    .ssd_ctl(ssd_ctl_en)
    );
    
    wire [2:0] D0,D1,D2,D3;
    shifter SF(
    .clk(clk_d),
    .rst(rst),
    .d0(D0),
    .d1(D1),
    .d2(D2),
    .d3(D3)
    );
    
    wire [7:0] Display0,Display1,Display2,Display3;
    ssd_decoder DC(
    .d0(D0),
    .d1(D1),
    .d2(D2),
    .d3(D3),
    .display0(Display0),
    .display1(Display1),
    .display2(Display2),
    .display3(Display3)
    );
    
    ssd_ctl CT(
    .display0(Display0),
    .display1(Display1),
    .display2(Display2),
    .display3(Display3),
    .ssd_ctl_en(ssd_ctl_en),
    .display(display),
    .display_c(display_c)
    );
    
endmodule

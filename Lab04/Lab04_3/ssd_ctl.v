`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/20 17:05:16
// Design Name: 
// Module Name: ssd_ctl
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


module ssd_ctl(
     display,
     ssd_ctl_en,
     display0,
     display1,
     display2,
     display3,
     display_c
    );
    output reg [7:0] display;
    input [1:0] ssd_ctl_en;
    input [7:0] display0;
    input [7:0] display1;
    input [7:0] display2;
    input [7:0] display3;
    output reg [3:0] display_c;
    
    always@(ssd_ctl_en)
        case(ssd_ctl_en)
        2'b00 :   display = display0;
        2'b01 :   display = display1;
        2'b10 :   display = display2;
        2'b11 :   display = display3;
        default : display = 8'b11111111;
        endcase
    
    always@(ssd_ctl_en)
        case(ssd_ctl_en)
        2'b00 :   display_c = 4'b1110;
        2'b01 :   display_c = 4'b1101;
        2'b10 :   display_c = 4'b1011;
        2'b11 :   display_c = 4'b0111;
        default : display_c = 4'b1111; 
        endcase
        
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/27 15:35:52
// Design Name: 
// Module Name: SSD_CTL
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
     display0,
     display1,
     ssd_ctl,
     display,
     display_c
    );
    input [7:0] display0;
    input [7:0] display1;
    input [1:0] ssd_ctl;
    output reg [7:0] display;
    output reg [3:0] display_c;
    
    always@(ssd_ctl or display0 or display1)
        case(ssd_ctl)
            2'b00 : display = display0;
            2'b01 : display = display1;
            2'b10 : display = 8'b1111_1111;
            2'b11 : display = 8'b1111_1111;
            default : display = 8'b1111_1111;
        endcase
        
    always@(ssd_ctl)
        case(ssd_ctl)
            2'b00 : display_c = 4'b1110;
            2'b01 : display_c = 4'b1101;
            2'b10 : display_c = 4'b1111;
            2'b11 : display_c = 4'b1111;
            default : display_c = 4'b1111;
        endcase
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/24 18:26:58
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
    input [7:0] dis0,
    input [7:0] dis1,
    input [7:0] dis2,
    input [7:0] dis3,
    input [1:0] ssd_ctl,
    output reg [7:0] display,
    output reg [3:0] display_c
    );
    
    always@*
        case(ssd_ctl)
        2'b00: display <= dis0;
        2'b01: display <= dis1;
        2'b10: display <= dis2;
        2'b11: display <= dis3;
        default: display <= 8'b1111_1110;
        endcase
        
    always@*
        case(ssd_ctl)
        2'b00: display_c <= 4'b1110;
        2'b01: display_c <= 4'b1101;
        2'b10: display_c <= 4'b1011;
        2'b11: display_c <= 4'b0111;
        default: display_c <= 4'b1111;
        endcase        
endmodule

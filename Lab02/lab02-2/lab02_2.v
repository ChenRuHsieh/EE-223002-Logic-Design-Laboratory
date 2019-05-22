`timescale 1ns / 1ps
`define SS_0 8'b00000011
`define SS_1 8'b10011111
`define SS_2 8'b00100101
`define SS_3 8'b00001101
`define SS_4 8'b10011001
`define SS_5 8'b01001001
`define SS_6 8'b01000001
`define SS_7 8'b00011111
`define SS_8 8'b00000001
`define SS_9 8'b00001001
`define SS_F 8'b01110001
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/06 18:56:05
// Design Name: 
// Module Name: lab02_2
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


module lab02_2(
    input  [3:0] i,
    output [3:0] d,
    output reg [7:0] D_ssd
    );
    
    assign d[0] = i[0];
    assign d[1] = i[1];
    assign d[2] = i[2];
    assign d[3] = i[3];
    always@*
        case(i)
         4'd0 : D_ssd = `SS_0;
         4'd1 : D_ssd = `SS_1;
         4'd2 : D_ssd = `SS_2;
         4'd3 : D_ssd = `SS_3;
         4'd4 : D_ssd = `SS_4;
         4'd5 : D_ssd = `SS_5;
         4'd6 : D_ssd = `SS_6;
         4'd7 : D_ssd = `SS_7;
         4'd8 : D_ssd = `SS_8;
         4'd9 : D_ssd = `SS_9;
         default : D_ssd = `SS_F;
        endcase

    
endmodule

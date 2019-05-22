`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/04 15:57:56
// Design Name: 
// Module Name: transform
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


module transform(
    input [8:0] last_change,
    output reg [3:0] last_change_b
    );
    wire [7:0] value;
    
    assign value = last_change[7:0];
    
    always@*
        case(value)
        8'h70: last_change_b <= 4'b0000; //0
        8'h69: last_change_b <= 4'b0001; //1
        8'h72: last_change_b <= 4'b0010; //2
        8'h7A: last_change_b <= 4'b0011; //3
        8'h6B: last_change_b <= 4'b0100; //4
        8'h73: last_change_b <= 4'b0101; //5
        8'h74: last_change_b <= 4'b0110; //6
        8'h6C: last_change_b <= 4'b0111; //7
        8'h75: last_change_b <= 4'b1000; //8
        8'h7D: last_change_b <= 4'b1001; //9
        default: last_change_b <= 4'b1111; 
        endcase
    
endmodule

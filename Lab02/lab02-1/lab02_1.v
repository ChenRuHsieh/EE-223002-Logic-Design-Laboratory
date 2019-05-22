`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/20 18:56:13
// Design Name: 
// Module Name: lab01_1
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


module lab01_1(
    input x,
    input y,
    input cin,
    output s,
    output cout
    );
    assign s = x ^ y ^ cin;
    assign cout = (x&y) | cin&(x^y);
    
endmodule

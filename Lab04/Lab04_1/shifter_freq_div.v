`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/18 21:50:39
// Design Name: 
// Module Name: shifter_freq_div
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


module shifter_freq_div(
    q,
    clk,
    rst
    );
    input  clk;
    input  rst;
    output [7:0] q;
    
    wire clk_d;
    wire [7:0] q;
    
    freq_div U0 (
        .clk_out(clk_d),
        .clk_in(clk),
        .rst(rst)
        );
    
    shifter U1 (
        .clk(clk_d),
        .rst(rst),
        .q(q)
        );
        
endmodule

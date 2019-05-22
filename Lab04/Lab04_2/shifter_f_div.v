`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/18 22:30:50
// Design Name: 
// Module Name: shifter_f_div
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


module shifter_f_div(
     clk,
     rst,
     choose_q,
     q
    );
    input  clk;
    input  rst;
    input  [7:0] choose_q;
    output reg [7:0] q;
    
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
        .q(q),
        .choose_q(choose_q)
        );
        
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 16:57:02
// Design Name: 
// Module Name: freq_div
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


module freq_div(
    input clk,
    output reg clk_1,
    output reg clk_100,
    output  [1:0] ssd_ctl
    );
    reg [26:0] cnt_50M;
    reg [26:0] cnt_500K;
    
    initial begin
        clk_1 = 1'b0;
        clk_100 = 1'b0;
        cnt_50M = 27'd0;
        cnt_500K = 27'd0;
    end
    
    assign ssd_ctl = cnt_50M[15:14];
    
    always@( posedge clk )
        if( cnt_50M == 50_000_000 )
        begin
            cnt_50M <= 27'd0;
            clk_1 <= ~clk_1;
        end
        else
        begin
            cnt_50M <= cnt_50M + 1'b1;
        end
     
    always@( posedge clk )
        if( cnt_500K == 500_000 )
        begin
            cnt_500K<= 27'd0;
            clk_100 <= ~clk_100;
        end
        else
        begin
            cnt_500K <= cnt_500K + 1'b1;
        end
             
endmodule

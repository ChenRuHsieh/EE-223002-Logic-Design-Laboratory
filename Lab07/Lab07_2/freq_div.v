`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/19 22:04:50
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
    output reg clk_d,
    output reg clk_f,
    output  [1:0] ssd_ctl
    );
    reg [26:0] cnt_50M;
    reg [26:0] cnt_500K;
    

    
    assign ssd_ctl = cnt_50M[15:14];
    
    always@( posedge clk )
        if( cnt_50M == 1_250_000 ) //50M=1s
        begin
            cnt_50M <= 27'd0;
            clk_d <= ~clk_d;
        end
        else
        begin
            cnt_50M <= cnt_50M + 1'b1;
        end
     
    always@( posedge clk )
        if( cnt_500K == 500_000 )
        begin
            cnt_500K<= 27'd0;
            clk_f <= ~clk_f;
        end
        else
        begin
            cnt_500K <= cnt_500K + 1'b1;
        end
              
endmodule

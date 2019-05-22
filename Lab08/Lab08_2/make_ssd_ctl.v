`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/24 18:58:49
// Design Name: 
// Module Name: make_ssd_ctl
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


module make_ssd_ctl(
    input clk,
   // input rst,
    output [1:0] ssd_ctl
    );
    
    reg [26:0] cnt;
    
    assign ssd_ctl = cnt[15:14];
    
    always@( posedge clk  )
        cnt <= cnt + 1'b1;
        
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/13 16:29:32
// Design Name: 
// Module Name: Lab03_1
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


module Lab03_1(
    input  f_crystal,
    input  rst,
    output f_out
    );
    reg  [26:0] cnt;
    reg  [26:0] cnt_tmp;
    
    assign f_out = cnt[26];
    
    always@(cnt)
        cnt_tmp = cnt + 1'b1;
        
    always@(posedge f_crystal or posedge rst)
        if(rst)
            cnt <= 27'b0;
        else
            cnt <= cnt_tmp;
endmodule

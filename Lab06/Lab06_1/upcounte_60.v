`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/12 23:52:54
// Design Name: 
// Module Name: upcounte_60
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


module upcounter_60sec(
    input clk_1,
    input rst,
    input en,
    output reg co_min
    );
    
    reg [8:0] cnt;
    reg [8:0] cnt_tmp;
    always@( posedge clk_1 or posedge rst)
        if(rst)
            cnt <= 9'b0;
        else
            cnt <= cnt_tmp;
            
    always@*
        if( cnt == 60)
        begin
            cnt_tmp <= 9'd0;
            co_min <= 1'b1;
        end
        else if(en)
        begin 
            cnt_tmp <= cnt + 1'b1;
            co_min <= 1'b0;
        end
        else
        begin
            cnt_tmp <= cnt;
            co_min <= 1'b0;    
        end
            
endmodule

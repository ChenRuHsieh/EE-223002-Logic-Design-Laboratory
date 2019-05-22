`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/13 00:07:08
// Design Name: 
// Module Name: upcounter_60min
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


module upcounter_60min(
    input clk_d,
    input rst,
    input add_en,
    output reg co_hr
    );
    reg [8:0] cnt;
    reg [8:0] cnt_tmp;
    
    always@( posedge clk_d or posedge rst)
        if(rst)
            cnt <= 9'd0;
        else
            cnt <= cnt_tmp;
            
    always@*
        if( cnt == 60)
        begin
            cnt_tmp <= 9'd0;
            co_hr <= 1'b1;
        end
        else if(add_en)
        begin 
            cnt_tmp <= cnt + 1'b1;
            co_hr <= 1'b0;
        end
        else
        begin
            cnt_tmp <= cnt;
            co_hr <= 1'b0;    
        end
    
endmodule

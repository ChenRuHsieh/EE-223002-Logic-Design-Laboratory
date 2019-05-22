`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 15:24:59
// Design Name: 
// Module Name: upcounter_24hr
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


module upcounter_24hr(
    input clk_d,
    input rst,
    input add_en,
    output reg co_day
    );
    
    reg [8:0] cnt;
    reg [8:0] cnt_tmp;
    always@( posedge clk_d or posedge rst)
        if(rst)
            cnt <= 9'd0;
        else
            cnt <= cnt_tmp;
            
    always@*
        if( cnt == 24)
        begin
            cnt_tmp <= 9'd0;
            co_day <= 1'b1;
        end
        else if(add_en)
        begin 
            cnt_tmp <= cnt + 1'b1;
            co_day <= 1'b0;
        end
        else
        begin
            cnt_tmp <= cnt;
            co_day <= 1'b0;    
        end
         
endmodule

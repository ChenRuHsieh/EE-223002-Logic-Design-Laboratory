`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/10 17:39:53
// Design Name: 
// Module Name: counter_d1
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


module counter24_d0(
    clk_1,
    rst,
    add_en,
    d0_24,
    d1_24,
    co
    );
    input clk_1;
    input rst;
    input add_en;
    input [3:0] d1_24;
    output reg [3:0] d0_24;
    output reg co;
    reg [3:0] d0_24_tmp;
    
    always@( posedge clk_1 or posedge rst)
        if(rst)
        begin
            d0_24 <= 4'b0000;
        end
        else
            d0_24 <= d0_24_tmp;
            
    always@( d1_24 or d0_24 or add_en or co)
        if( (d1_24==4'd2) && (d0_24==4'd3) && add_en) //23->00
        begin
            d0_24_tmp <= 4'd0;
            co <= 1'b1;
        end
        else if( (d0_24==4'd9) && add_en) //19->20
        begin
            d0_24_tmp <= 4'd0;
            co <=1'b1;
        end 
        else if( add_en )              //18->19
        begin
            d0_24_tmp <= d0_24 + 1'b1;
            co <= 1'b0;
        end
        else
        begin
            d0_24_tmp <= d0_24;
            co <= 1'b0;
        end
endmodule

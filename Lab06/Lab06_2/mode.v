`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 17:18:17
// Design Name: 
// Module Name: mode
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


module mode(
    input  choose_mode,
    input  [3:0] day_d0,
    input  [3:0] day_d1,
    input  [3:0] month_m0,
    input  [3:0] month_m1,
    input  [3:0] year_y0,
    input  [3:0] year_y1,
    output reg [3:0] d0,
    output reg [3:0] d1,
    output reg [3:0] d2,
    output reg [3:0] d3
    );
    
    always@*
        if(choose_mode) 
        begin //year
            d0 <= year_y0;
            d1 <= year_y1;
            d2 <= 4'd0;
            d3 <= 4'd0;
        end
        else
        begin //month/day
            d0 <= day_d0;
            d1 <= day_d1;
            d2 <= month_m0;
            d3 <= month_m1;
        end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 15:24:59
// Design Name: 
// Module Name: year_y1_counter
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


module year_y1_counter(
    input clk_d,
    input rst,
    input add_en,
    output reg [3:0] year_y1
    );
    reg [3:0] year_y1_tmp;
    
    always@( posedge clk_d or posedge rst )
     if(rst)
        year_y1 <= 4'd0;
     else
        year_y1 <= year_y1_tmp;
        
    always@*
        if(add_en)
            year_y1_tmp <= year_y1 +1'b1;
        else
            year_y1_tmp <= year_y1; 
endmodule

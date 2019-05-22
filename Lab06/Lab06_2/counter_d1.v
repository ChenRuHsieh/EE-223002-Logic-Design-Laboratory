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


module counter24_d1(
    clk_1,
    rst,
    add_en,
    d1_24
    );
    input clk_1;
    input rst;
    input add_en;
    output reg [3:0] d1_24;
    reg [3:0] d1_24_tmp;
    
    always@( posedge clk_1 or posedge rst)
        if(rst)
            d1_24 <= 4'b0000;
        else
            d1_24 <= d1_24_tmp;
            
    always@( d1_24 or add_en )
        if( (d1_24 == 4'd2) && add_en )
            d1_24_tmp <= 4'd0;
        else if( add_en )
            d1_24_tmp <= d1_24 + 1'b1;
        else
            d1_24_tmp <= d1_24;
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 16:57:02
// Design Name: 
// Module Name: lap_en
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


module choose_mode(
    input clk_100,
    input [3:0] sec_s0,
    input [3:0] sec_s1,
    input [3:0] min_m0,
    input [3:0] min_m1,
    input freeze_en,
    output reg [3:0] d0,
    output reg [3:0] d1,
    output reg [3:0] d2,
    output reg [3:0] d3
    );
    reg [3:0] d0_tmp;
    reg [3:0] d1_tmp;
    reg [3:0] d2_tmp;
    reg [3:0] d3_tmp;
    
    always@( posedge clk_100 )
    begin
        d0 <= d0_tmp;
        d1 <= d1_tmp;
        d2 <= d2_tmp;
        d3 <= d3_tmp;
    end
    
    always@*
        if(freeze_en)
        begin
            d0_tmp <= d0;
            d1_tmp <= d1;
            d2_tmp <= d2;
            d3_tmp <= d3;
        end
        else
        begin
            d0_tmp <= sec_s0;
            d1_tmp <= sec_s1;
            d2_tmp <= min_m0;
            d3_tmp <= min_m1;
        end
    
endmodule

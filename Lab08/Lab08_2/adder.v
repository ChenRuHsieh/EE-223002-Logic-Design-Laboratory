`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/04 16:10:23
// Design Name: 
// Module Name: adder
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


module adder(
    input clk,
    input rst,
    input [3:0] aug,
    input [3:0] adden,
    output reg [3:0] d0,
    output reg [3:0] d1
    );
    reg [3:0] d0_tmp,d1_tmp;
    wire [4:0] value;
    
    assign value = aug + adden;
    
    
    always@(posedge clk or posedge rst)
        if(rst)
        begin
            d0 <= 4'd0;
            d1 <= 4'd0;
        end
        else 
        begin
            d0 <= d0_tmp;
            d1 <= d1_tmp;
        end
        
    always@*
        if(value < 10)
        begin
            d0_tmp <= value[3:0];
            d1_tmp <= 4'd0;
        end    
        else
        begin
            d0_tmp <= value - 10;
            d1_tmp <= 4'd1;        
        end    
    
    
endmodule

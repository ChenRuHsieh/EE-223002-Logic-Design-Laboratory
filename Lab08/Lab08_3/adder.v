`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/05 16:38:46
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
    input [3:0] store_s0,
    input [3:0] store_s1,
    input [3:0] store_s2,
    input [3:0] store_s3, //s3s2+s1s0=a3a2a1a0
    output reg [3:0] add_a0,
    output reg [3:0] add_a1,
    output reg [3:0] add_a2,
    output reg [3:0] add_a3
    );
    reg [3:0] add_a0_tmp, add_a1_tmp, add_a2_tmp, add_a3_tmp;
    wire [4:0] sum_one,sum_ten,sum_hun;
    reg co_ten,co_hun;
    assign sum_one = store_s2 + store_s0;
    assign sum_ten = store_s3 + store_s1 + co_ten;
    
    always@(posedge clk or posedge rst)
        if(rst)
        begin
            add_a0 <= 4'd0;
            add_a1 <= 4'd0;
            add_a2 <= 4'd0; 
            add_a3 <= 4'd0;
        end
        else
        begin
            add_a0 <= add_a0_tmp;
            add_a1 <= add_a1_tmp;
            add_a2 <= add_a2_tmp; 
            add_a3 <= add_a3_tmp;                 
        end
        
    always@*
        if(sum_one < 10)
        begin
            add_a0_tmp = sum_one;
            co_ten = 1'b0; 
        end
        else
        begin
            add_a0_tmp = sum_one - 10;
            co_ten = 1'b1;
        end
        
    always@*
        if(sum_ten < 10)
        begin
            add_a1_tmp = sum_ten;
            co_hun = 1'b0;             
        end
        else
        begin
            add_a1_tmp = sum_ten - 10;
            co_hun = 1'b1;
        end    
    
    always@*
        if(co_hun)
            add_a2_tmp = 4'd1;
        else
            add_a2_tmp = 4'd0;
    
    always@*
        add_a3_tmp = 4'd0;
              
endmodule

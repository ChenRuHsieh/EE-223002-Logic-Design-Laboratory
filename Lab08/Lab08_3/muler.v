`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/05 17:02:21
// Design Name: 
// Module Name: muler
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


module muler(
    input clk,
    input rst,
    input [3:0] store_s0,
    input [3:0] store_s1,
    input [3:0] store_s2,
    input [3:0] store_s3,
    output reg [3:0] mul_m0,
    output reg [3:0] mul_m1,
    output reg [3:0] mul_m2,
    output reg [3:0] mul_m3
    );
    wire [3:0] mul_m0_tmp, mul_m1_tmp, mul_m2_tmp, mul_m3_tmp;
    reg co_ten,co_hun,co_thus;
    wire [14:0] value;
    assign value = (4'd10*store_s3 + store_s2) * (4'd10*store_s1 + store_s0);
    assign mul_m0_tmp = value % 4'd10;
    assign mul_m1_tmp = ((value - mul_m0_tmp) % 7'd100) / 4'd10;
    assign mul_m2_tmp = ((value - mul_m1_tmp*4'd10 - mul_m0_tmp) % 11'd1000) / 7'd100;
    assign mul_m3_tmp = (value - mul_m2_tmp*7'd100 - mul_m1_tmp*4'd10 - mul_m0_tmp) / 11'd1000;
    
     
    always@(posedge clk or posedge rst)
        if(rst)
        begin
            mul_m0 = 4'd0;
            mul_m1 = 4'd0;
            mul_m2 = 4'd0;
            mul_m3 = 4'd0; 
        end
        else
        begin
            mul_m0 = mul_m0_tmp;
            mul_m1 = mul_m1_tmp;
            mul_m2 = mul_m2_tmp;
            mul_m3 = mul_m3_tmp;
        end
        
   
    
    
    
    
    
    
endmodule

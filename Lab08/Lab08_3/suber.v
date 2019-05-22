`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/05 17:02:21
// Design Name: 
// Module Name: suber
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


module suber(
    input clk,
    input rst,
    input [3:0] store_s0,
    input [3:0] store_s1,
    input [3:0] store_s2,
    input [3:0] store_s3,
    output reg [3:0] sub_s0, //t3t2-t1t0=s3s2s1s0
    output reg [3:0] sub_s1,
    output reg [3:0] sub_s2,
    output reg [3:0] sub_s3
    );
    reg [3:0] sub_s0_tmp, sub_s1_tmp, sub_s2_tmp, sub_s3_tmp;
    reg br_ten;
    wire negative;
  //  assign negative = (store_s3 < store_s1) | (store_s3 == store_s1) && (store_s2 < store_s0);
    
    always@(posedge clk or posedge rst)
        if(rst)
        begin
            sub_s0 = 4'd0;
            sub_s1 = 4'd0;
            sub_s2 = 4'd0;
            sub_s3 = 4'd0;
        end
        else
        begin
            sub_s0 = sub_s0_tmp;
            sub_s1 = sub_s1_tmp;
            sub_s2 = sub_s2_tmp;
            sub_s3 = sub_s3_tmp;
        end
    assign negative = (store_s3 < store_s1) | (store_s3 == store_s1) && (store_s2 < store_s0);
    always@*
        if(negative)
        begin
            if(store_s2 > store_s0)
            begin
                sub_s0_tmp = store_s0 + 4'd10 - store_s2;
                br_ten = 1'b1;
            end
            else
            begin
                sub_s0_tmp = store_s0 - store_s2;
                br_ten = 1'b0;
            end
        end
        else if(store_s2 < store_s0)
        begin
            sub_s0_tmp = store_s2 + 4'd10 - store_s0;
            br_ten = 1'b1;
        end
        else
        begin
            sub_s0_tmp = store_s2 - store_s0;
            br_ten = 1'b0;
        end
        
    always@*
        if(negative)
        begin
            sub_s1_tmp = store_s1 - store_s3 - br_ten;
        end
        else
        begin
            sub_s1_tmp = store_s3 - store_s1 - br_ten;
        end    
     
    always@*
        sub_s2_tmp = 4'd0;
               
    always@*
        if(negative)
            sub_s3_tmp = 4'd15; //-
        else
            sub_s3_tmp = 4'd0;
    
endmodule

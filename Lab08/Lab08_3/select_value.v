`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/08 17:24:13
// Design Name: 
// Module Name: select_value
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


module select_value(
    input add_en,sub_en,mul_en,result_en,
    input [3:0] store_s0,store_s1,store_s2,store_s3,
    input [3:0] add_a0,add_a1,add_a2,add_a3,
    input [3:0] sub_s0,sub_s1,sub_s2,sub_s3,
    input [3:0] mul_m0,mul_m1,mul_m2,mul_m3,
    output reg [3:0] d0,d1,d2,d3
    );
    
    always@*
        if(result_en)
        begin
            if(add_en)
            begin
                d0 <= add_a0;
                d1 <= add_a1;
                d2 <= add_a2;
                d3 <= add_a3;
            end
            else if(sub_en)
            begin
                d0 <= sub_s0;
                d1 <= sub_s1;
                d2 <= sub_s2;
                d3 <= sub_s3;
            end
            else if(mul_en)
            begin
                d0 <= mul_m0;
                d1 <= mul_m1;
                d2 <= mul_m2;
                d3 <= mul_m3;
            end
            else
            begin
                d0 <= store_s0;
                d1 <= store_s1;
                d2 <= store_s2;
                d3 <= store_s3;                
            end
        end
        else
        begin
            d0 <= store_s0;
            d1 <= store_s1;
            d2 <= store_s2;
            d3 <= store_s3;
        end
    
    
endmodule

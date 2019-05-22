`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 15:24:59
// Design Name: 
// Module Name: month_m1_counter
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


module month_m1_counter(
     clk_d,
     rst,
     add_en,
     month_m1,
     co_year
    );
    input clk_d;
    input rst;
    input add_en;
    output reg [3:0] month_m1;
    output reg co_year;
    reg [3:0] month_m1_tmp;
    
    always@( posedge clk_d or posedge rst)
    if(rst)
        month_m1 <= 4'd0;
    else
        month_m1 <= month_m1_tmp;

    always@*
    if( (month_m1==4'd1) && add_en )
    begin  //12->01
        month_m1_tmp <= 4'd0;
        co_year <= 1'b1;
    end  
    else if( add_en )
    begin //09->10
        month_m1_tmp <= month_m1 + 1'b1;
        co_year <= 1'b0;
    end
    else
    begin
        month_m1_tmp <= month_m1;
        co_year <= 1'b0;
    end
                
endmodule

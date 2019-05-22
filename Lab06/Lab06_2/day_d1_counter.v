`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 15:24:59
// Design Name: 
// Module Name: day_d1_counter
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


module day_d1_counter(
     clk_d,
     rst,
     add_en,
     month_big,
     month_two,
     day_d1,
     co_month
    );
    input clk_d;
    input rst;
    input add_en;
    input month_big;
    input month_two;
    output reg [3:0] day_d1;
    output reg co_month;
    reg [3:0] day_d1_tmp;
    
    always@( posedge clk_d or posedge rst)
            if(rst)
                day_d1 <= 4'b0000;
            else
                day_d1 <= day_d1_tmp;
                
        always@*
            if( month_two && (day_d1 == 4'd2) && add_en )
            begin  //28->01
                day_d1_tmp <= 4'd0;
                co_month <= 1'b1;
            end  
            else if( (day_d1 == 4'd3) && add_en )
            begin //30/31->01
                day_d1_tmp <= 4'd0;
                co_month <= 1'b1;
            end  
            else if( add_en )
            begin //19->20
                day_d1_tmp <= day_d1 + 1'b1;
                co_month <= 1'b0;
            end
            else
            begin
                day_d1_tmp <= day_d1;
                co_month <= 1'b0;
            end
            
endmodule



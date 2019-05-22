`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 15:24:59
// Design Name: 
// Module Name: month_m0_counter
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


module month_m0_counter(
     clk_d,
     rst,
     add_en,
     month_big,
     month_two,
     month_m0,
     month_m1,
     co_m1
    );
    input clk_d;
    input rst;
    input add_en;
    input [3:0] month_m1;
    output reg month_big;
    output reg month_two;
    output reg [3:0] month_m0;
    output reg  co_m1;
    reg [3:0] month_m0_tmp;
        
        always@( posedge clk_d or posedge rst)
            if(rst)
            begin
                month_m0 <= 4'b0001;
            end
            else
                month_m0 <= month_m0_tmp;
                    
        always@*
            if( (month_m1==4'd1) && (month_m0==4'd2) && add_en )   
            begin //12->01
                month_m0_tmp <= 4'd1;
                co_m1 <= 1'b1;
            end 
            else if( (month_m0==4'd9) && add_en ) 
            begin //09->10
                month_m0_tmp <= 4'd0;
                co_m1 <= 1'b1;
            end
            else if( add_en )              
            begin //08->09
                month_m0_tmp <= month_m0 + 1'b1;
                co_m1 <= 1'b0;
            end
            else
            begin
                month_m0_tmp <= month_m0;
                co_m1 <= 1'b0;
            end
            
        always@*
            if(month_m1==4'd1)
            begin
                case(month_m0)
                4'd0:
                begin
                    month_big = 1'b1;
                    month_two = 1'b0;
                end
                4'd1:
                begin
                    month_big = 1'b0;
                    month_two = 1'b0;
                end
                4'd2:
                begin
                    month_big = 1'b1;
                    month_two = 1'b0;
                end
                default:
                begin
                    month_big = 1'b0;
                    month_two = 1'b0;
                end
                endcase
            end
            else
            begin
                case(month_m0)
                4'd1:
                begin
                    month_big = 1'b1;
                    month_two = 1'b0;
                end
                4'd2:
                begin
                    month_big = 1'b0;
                    month_two = 1'b1;
                end
                4'd3:
                begin
                    month_big = 1'b1;
                    month_two = 1'b0;
                end
                4'd4:
                begin
                    month_big = 1'b0;
                    month_two = 1'b0;
                end
                4'd5:
                begin
                    month_big = 1'b1;
                    month_two = 1'b0;
                end
                4'd6:
                begin
                    month_big = 1'b0;
                    month_two = 1'b0;
                end
                4'd7:
                begin
                    month_big = 1'b1;
                    month_two = 1'b0;
                end
                4'd8:
                begin
                    month_big = 1'b1;
                    month_two = 1'b0;
                end
                4'd9:
                begin
                    month_big = 1'b0;
                    month_two = 1'b0;
                end
                default:
                begin
                    month_big = 1'b0;
                    month_two = 1'b0;
                end
                endcase
            end
                
endmodule

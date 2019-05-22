`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 16:57:02
// Design Name: 
// Module Name: min_m1
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


module min_m1(
    input clk_1,
    input rst_f,
    input rst,
    input count_en,
    input co_m1,
    output reg [3:0] min_m1
    );
    reg [3:0] min_m1_tmp;
    
    always@( posedge clk_1 or posedge rst or posedge rst_f )
        if( rst || rst_f )
           min_m1 <= 4'd0;
        else 
           min_m1 <= min_m1_tmp;
           
    always@*
        if( ~count_en )
        begin //stop
            min_m1_tmp <= min_m1;
        end
        else if( ~co_m1 )
        begin //not co
            min_m1_tmp <= min_m1;
        end
        else if( min_m1==4'd5 )
        begin //59->00
            min_m1_tmp <= 4'd0;
        end
        else
        begin //49->50
            min_m1_tmp <= min_m1 + 1'b1;
        end 
endmodule

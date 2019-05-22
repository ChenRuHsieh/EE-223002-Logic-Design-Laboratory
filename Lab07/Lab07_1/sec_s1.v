`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 16:57:02
// Design Name: 
// Module Name: sec_s1
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


module sec_s1(
    input clk_1,
    input rst_f,
    input rst,
    input count_en,
    input co_s1,
    output reg co_min,
    output reg [3:0] sec_s1
    );
    reg [3:0] sec_s1_tmp;
    
    always@( posedge clk_1 or posedge rst or posedge rst_f)
        if( rst || rst_f )
        begin
           sec_s1 <= 4'd0;
          // co_min <= 1'b0;
        end 
        else
        begin
           sec_s1 <= sec_s1_tmp;
        end
    
    always@*
        if( ~count_en )
        begin //stop
            sec_s1_tmp <= sec_s1;
            co_min <= 1'b0;
        end
        else if( ~co_s1)
        begin //not co
            sec_s1_tmp <= sec_s1;
            co_min <= 1'b0;
        end
        else if( (sec_s1==4'd5) /*&& co_s1*/ )
        begin //59->00
            sec_s1_tmp <= 4'd0;
            co_min <= 1'b1;
        end
        else
        begin //49->50
            sec_s1_tmp <= sec_s1 + 1'b1;
            co_min <= 1'b0;
        end       
endmodule

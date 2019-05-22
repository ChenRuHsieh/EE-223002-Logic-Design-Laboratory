`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 16:57:02
// Design Name: 
// Module Name: min_m0
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


module min_m0(
    input clk_1,
    input rst_f,
    input rst,
    input count_en,
    input co_min,
    input [3:0] min_m1,
    output reg [3:0] min_m0,
    output reg co_m1
    );
    reg [3:0] min_m0_tmp;
    
    always@( posedge clk_1 or posedge rst or posedge rst_f )
        if( rst || rst_f )
        begin
            min_m0 <= 4'd0;
           // co_m1 <= 1'b0;
        end
        else
        begin
            min_m0 <= min_m0_tmp;
        end
    
    always@*
        if( ~count_en )
        begin //stop
            min_m0_tmp <= min_m0;
            co_m1 <= co_m1;
        end
        else if( ~co_min )
        begin //not co
            min_m0_tmp <= min_m0;
            co_m1 <= 1'b0;
        end
        else if( (min_m1==4'd5) && (min_m0==4'd9) )
        begin //59->00
            min_m0_tmp <= 4'd0;
            co_m1 <= 1'b1;
        end
        else if( min_m0==4'd9 )
        begin //49->50
            min_m0_tmp <= 4'd0;
            co_m1 <= 1'b1;
        end
        else
        begin //48->49 
            min_m0_tmp <= min_m0 + 1'b1;
            co_m1 <= 1'b0;
        end

endmodule

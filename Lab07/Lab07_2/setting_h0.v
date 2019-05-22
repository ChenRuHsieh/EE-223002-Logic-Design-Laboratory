`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/23 14:00:49
// Design Name: 
// Module Name: setting_h0
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


module setting_h0(
    input clk_d,
    input rst,
    input set_en,
    input one_pulse_hr,
    input [3:0] set_h1,
    
    output reg [3:0] set_h0,
    output reg co_h1
    );
    reg [3:0] set_tmp;
    
    always@( posedge clk_d or posedge rst )
        if(rst)
            set_h0 <= 4'd0;
        else
            set_h0 <= set_tmp;
            
    always@*
        if( set_en && one_pulse_hr && set_h1==4'd2 && set_h0==4'd3)
        begin //23->00
            set_tmp = 4'd0;
            co_h1 = 1'b1;
        end
        else if( set_en && one_pulse_hr && set_h0==4'd9 )
        begin //09->10
           set_tmp = 4'd0;
           co_h1 = 1'b1;
        end
        else if( set_en && one_pulse_hr )
        begin //08->09
            set_tmp = set_h0 + 1'b1;
            co_h1 = 1'b0; 
        end
        else
        begin
            set_tmp = set_h0;
            co_h1 = 1'b0;
        end    
    
endmodule

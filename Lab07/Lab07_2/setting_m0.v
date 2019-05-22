`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/23 13:47:25
// Design Name: 
// Module Name: setting_m0
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


module setting_m0(
    input clk_d,
    input rst,
    input set_en,
    input one_pulse_min,
    
    output reg [3:0] set_m0,
    output reg co_m1
    );
    reg [3:0] set_tmp;
    
    always@( posedge clk_d or posedge rst )
        if(rst)
            set_m0 <= 4'd0;
        else
            set_m0 <= set_tmp;
            
    always@*
        if( set_en && one_pulse_min && set_m0==4'd9)
        begin //09->10
            set_tmp = 4'd0;
            co_m1 = 1'b1;
        end
        else if( set_en && one_pulse_min )
        begin //08->09
           set_tmp = set_m0 + 1'b1;
           co_m1 = 1'b0;
        end
        else
        begin
            set_tmp = set_m0;
            co_m1 = 1'b0;
        end
           
    
endmodule

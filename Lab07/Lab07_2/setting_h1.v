`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/23 14:00:49
// Design Name: 
// Module Name: setting_h1
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


module setting_h1(
    input clk_d,
    input rst,
    input set_en,
    input co_h1,
    
    output reg [3:0] set_h1
    );
    reg [3:0] set_tmp;
    
    always@( posedge clk_d or posedge rst )
        if(rst)
            set_h1 <= 4'd0;
        else
            set_h1 <= set_tmp; 
            
    always@*
        if( set_en && co_h1 && set_h1==4'd2 )
        begin //59->00
            set_tmp = 4'd0;    
        end
        else if( set_en && co_h1 )
        begin
            set_tmp = set_h1 + 1'b1;
        end
        else
        begin
            set_tmp = set_h1;
        end 
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/27 14:11:32
// Design Name: 
// Module Name: downcounter_d0
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


module downcounter_d0(
     clk_d,
     en,
     rst,
     rst_2,
     decrease,
     d0,
     br0,
     LEDs
    );
    input clk_d;
    input en;
    input rst;
    input rst_2;
    input decrease;
    output reg [3:0] d0;
    output reg br0;
    output reg [15:0] LEDs;
    reg [3:0] d0_tmp;
    
    always@( posedge clk_d or posedge rst or posedge rst_2)
        if(rst)
            d0 <= 4'b0000;
        else if(rst_2)
            d0 <= 4'b0000;
        else
            d0 <= d0_tmp;
     
     
     always@( d0 or en or decrease)
        if( (d0==4'b0000) && en && decrease)       //20->19
            begin
            d0_tmp = 4'b1001;
            br0 = 1;                           //個位數的借位
            LEDs = 16'b0000_0000_0000_0000;
            end
         else if ( en && decrease)             //19->18
            begin
            d0_tmp = d0 - 1'b1;
            br0 = 0;
            LEDs = 16'b0000_0000_0000_0000;
            end
          else if( ~en )                       //暫停
            begin
            d0_tmp = d0;
            br0 = 0;
            LEDs = 16'b0000_0000_0000_0000;
            end
          else if(~decrease)                   //已經數到00
            begin
            d0_tmp = 4'b0000;
            br0 = 0;
            LEDs = 16'b1111_1111_1111_1111;
            end
          else
            begin
            d0_tmp = 4'b0000;
            br0 = 16'b0000_0000_0000_0000;
            end 
endmodule

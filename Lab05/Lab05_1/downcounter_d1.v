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


module downcounter_d1(
     clk_d,
     en,
     rst,
     decrease,
     d1
    );
    input clk_d;
    input en;
    input rst;
    input decrease;
    output reg [3:0] d1;
    reg [3:0] d1_tmp;
    
    always@( posedge clk_d or posedge rst)
        if(rst)
            d1 = 4'b0011;                  //十位數3
        else
            d1 = d1_tmp;
     
     
     always@( d1 or en or decrease)
        if(  en && decrease ) 
            d1_tmp <= d1 - 1'b1;                    //以數到00
        else if( ~en )                      //暫停
            d1_tmp <= d1;                    
        else if( ~decrease)            //2X->1X
            d1_tmp <= d1;
        else
            d1_tmp <= d1;
endmodule

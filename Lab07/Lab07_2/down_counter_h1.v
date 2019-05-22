`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/19 22:41:31
// Design Name: 
// Module Name: down_counter_m1
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


module down_counter_h1(
    input clk_d,
    input rst,
    input rst_f,
    input de_en,
    input set_en,
    input br_h1,
    input [3:0] set_h1,
    
    output reg [3:0] hr_h1
    );
  //  reg [3:0] hr_h1_set_tmp;
   // reg [3:0] hr_h1_de_tmp;
    //reg [3:0] hr_h1_set;
    reg [3:0] hr_h1_de;    
    
    always@( posedge clk_d or posedge rst or posedge rst_f or posedge set_en )
        if( rst || rst_f )
            hr_h1 <= 4'd0;
        else if( set_en )
            hr_h1 <= set_h1;
        else
            hr_h1 <= hr_h1_de;
    
    always@*
        if( de_en ) //decrease
        begin
           if( br_h1 )
            begin //40->39
                hr_h1_de = hr_h1 - 1'b1;
            end
            else
            begin 
                hr_h1_de = hr_h1;
            end
        end
        else //pause
        begin
           hr_h1_de = hr_h1;
        end
        
 /*   always@(posedge clk_f or posedge rst)
        if(rst)
        begin
            hr_h1_set <= 4'd0;    
            hr_h1_de <= 4'd0;
        end
        else
        begin
            hr_h1_set <= hr_h1_set_tmp;
            hr_h1_de <= hr_h1_de_tmp;
        end*/
endmodule

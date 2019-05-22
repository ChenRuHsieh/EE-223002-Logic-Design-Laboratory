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


module down_counter_m1(
    input clk_d,
    input rst,
    input rst_f,
    input de_en,
    input set_en,
    input br_m1,
    input [3:0] set_m1,
    
    output reg [3:0] min_m1,
    output reg br_h0
    );
  //  reg [3:0] min_m1_set;
    reg [3:0] min_m1_de;
  //  reg [3:0] min_m1_set_tmp;
  //  reg [3:0] min_m1_de_tmp;
        
    always@( posedge clk_d or posedge rst or posedge rst_f or posedge set_en )
        if( rst || rst_f )
            min_m1 <= 4'd0;
        else if( set_en )
            min_m1 <= set_m1;
        else
            min_m1 <= min_m1_de;
    
    always@*
        if( de_en ) //decrease
        begin
            if( min_m1==4'd0 && br_m1 )
            begin //00->59
                min_m1_de = 4'd5;
                br_h0 = 1'b1;
            end
            else if( br_m1 )
            begin //40->39
                min_m1_de = min_m1 - 1'b1;
                br_h0 = 1'b0;
            end
            else
            begin 
                min_m1_de = min_m1;
                br_h0 = 1'b0;
            end
        end
        else //pause
        begin
            min_m1_de = min_m1;
        end
    
 /*   always@(posedge clk_f or posedge rst)
        if(rst)
        begin
            min_m1_set <= 4'd0;
            min_m1_de <= 4'd0; 
        end
        else
        begin
            min_m1_set <= min_m1_set_tmp;
            min_m1_de <= min_m1_de_tmp;
        end    */
   
endmodule

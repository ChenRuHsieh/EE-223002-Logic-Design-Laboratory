`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/05 14:20:36
// Design Name: 
// Module Name: Debounce
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


module debounce(
     clk_100,
     rst,
     pb_in,
     pb_de
    );
    input clk_100;
    input rst;
    input pb_in;
    output reg pb_de;
    reg [3:0] debounce_window;
    reg pb_de_next; 
    
    initial begin
        debounce_window = 4'b0000;
        pb_de = 1'b0;
    end
    
    always@( posedge clk_100 or posedge rst)
        if(rst)
            debounce_window <= 4'b0000;
        else
            debounce_window <= {debounce_window[2:0],pb_in}; 
            
    always@*
        if(debounce_window == 4'b1111)
            pb_de_next <= 1'b1;
        else
            pb_de_next <= 1'b0;
            
     always@( posedge clk_100 or posedge rst)
        if(rst)
            pb_de <= 1'b0;
        else
            pb_de <= pb_de_next;
endmodule

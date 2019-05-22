`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/05 14:10:00
// Design Name: 
// Module Name: One_pulse
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


module One_pulse(
     clk_100,
     pb_de,
     one_pulse,
     rst
    );
    input clk_100;
    input pb_de;
    input rst;
    output reg one_pulse;
    reg pb_de_delay;
    

    
    always@( posedge clk_100 or posedge rst )
        if(rst)
            pb_de_delay <= 1'b0;
        else 
            pb_de_delay <= pb_de;
    
    assign one_pulse_next = pb_de & (~pb_de_delay);
    
    always@( posedge clk_100 or posedge rst )
        if(rst)
            one_pulse <= 1'b0;
        else 
            one_pulse <= one_pulse_next;
    
endmodule

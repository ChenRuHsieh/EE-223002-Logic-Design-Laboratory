`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/12 23:13:11
// Design Name: 
// Module Name: change_AP
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


module change_ap(
     change_am,
     rst,
     am_en
    );
    input change_am;
    input rst;
    output reg am_en;
    
    initial begin
        am_en = 1'b1;
    end
    
    always@(posedge change_am or posedge rst)
        if(rst)
            am_en <= 1'b1;
        else if(change_am)
            am_en <= ~am_en;
        else
            am_en <= am_en;
endmodule

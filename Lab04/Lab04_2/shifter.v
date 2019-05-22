`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/18 22:30:50
// Design Name: 
// Module Name: shifter_f_div
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


module shifter(
     clk,
     rst,
     choose_q,
     q
    );
    input  clk;
    input  rst;
    input  [7:0] choose_q;
    output reg [7:0] q;
    
    initial
    begin
        q <= 8'b0;
    end
    
    always@( posedge clk or  posedge rst )
    begin
        if(rst)
            q <= choose_q;
        else
        begin
            q[0] <= q[7];
            q[1] <= q[0];
            q[2] <= q[1];
            q[3] <= q[2];
            q[4] <= q[3];
            q[5] <= q[4];
            q[6] <= q[5];
            q[7] <= q[6];
        end
    end
endmodule

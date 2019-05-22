`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/04 15:53:13
// Design Name: 
// Module Name: store
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


module store(
    input [3:0] last_change_b,
    input tf_en,
    output reg [3:0] aug,
    output reg [3:0] adden
    );
    reg choose_add;
    
    always@(posedge tf_en)
        if(choose_add)
        begin
            adden = last_change_b;
            choose_add = 1'b0;
        end
        else
        begin
            aug = last_change_b;
            choose_add = 1'b1;
        end
    
    
endmodule

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
    input rst,
    input tf_en,
    output reg [3:0] store_s0,
    output reg [3:0] store_s1,
    output reg [3:0] store_s2,
    output reg [3:0] store_s3
    );
    reg [1:0] choose;
    
    always@(posedge tf_en or posedge rst)
        if(rst)
        begin
            store_s3 = 4'd0;
            store_s2 = 4'd0;
            store_s1 = 4'd0;
            store_s0 = 4'd0;
            choose = 2'b00;
        end
        else if(choose==2'b00)
        begin
            store_s3 = last_change_b;
            choose = 2'b01;
        end
        else if(choose==2'b01)
        begin
            store_s2 = last_change_b;
            choose = 2'b10;
        end
        else if(choose==2'b10)
        begin
            store_s1 = last_change_b;
            choose = 2'b11;
        end
        else if(choose==2'b11)
        begin
            store_s0 = last_change_b;
            choose = 2'b00;            
        end
        else
        begin
            choose = 2'b00;
        end
    
    
endmodule

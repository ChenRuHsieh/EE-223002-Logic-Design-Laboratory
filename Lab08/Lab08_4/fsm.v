`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/08 19:06:10
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk,
    input rst,
    input shift_en,
    input cap_en,
    //output reg shift,
    output reg mini
    );
    reg [1:0] state;
    reg [1:0] next_state;
    
    always@(posedge clk or posedge rst)
        if(rst)
            state <= 2'b00;
        else
            state <= next_state;
            
    always@*
        case(state)
        2'b00: //small
            if(cap_en)
            begin
                next_state = 2'b01;
                mini = 1'b0;
            end
            else if(shift_en)
            begin
                next_state = 2'b10;
                mini = 1'b0;
            end
            else
            begin
                next_state = 2'b00;
                mini = 1'b1;
            end
        2'b01: //big
            if(cap_en)
            begin
                next_state = 2'b00;
                mini = 1'b1;
            end
            else if(shift_en)
            begin
                next_state = 2'b11;
                mini = 1'b1;
            end
            else
            begin
                next_state = 2'b01;
                mini = 1'b0;
            end
        2'b10: //small+shift => big 
            if(~shift_en)
            begin
                next_state = 2'b00;
                mini = 1'b1;
            end
            else
            begin
                next_state = 2'b10;
                mini = 1'b0;
            end
        2'b11: //big+shift => small
            if(~shift_en)
            begin
                next_state = 2'b01;
                mini = 1'b0;
            end
            else
            begin
                next_state = 2'b11;
                mini = 1'b1;
            end          
        default:
        begin
            next_state = 2'b00;
            mini = 1'b0;
        end
        endcase
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/04 19:04:00
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
    input add,
    input sub,
    input mul,
    output reg add_en,
    output reg sub_en,
    output reg mul_en
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
        2'b00: //start
        begin
            if(add)
            begin
                next_state = 2'b01;
                add_en = 1'b1;
                sub_en = 1'b0;
                mul_en = 1'b0;
            end
            else if(sub)
            begin
                next_state = 2'b10;
                add_en = 1'b0;
                sub_en = 1'b1;
                mul_en = 1'b0;            
            end
            else if(mul)
            begin
                next_state = 2'b11;
                add_en = 1'b0;
                sub_en = 1'b0;
                mul_en = 1'b1;           
            end
            else
            begin
                next_state = 2'b00;
                add_en = 1'b0;
                sub_en = 1'b0;
                mul_en = 1'b0;
            end    
        end
        2'b01: //add
        begin
            if(add)
            begin
                next_state = 2'b01;
                add_en = 1'b1;
                sub_en = 1'b0;
                mul_en = 1'b0;
            end
            else if(sub)
            begin
                next_state = 2'b10;
                add_en = 1'b0;
                sub_en = 1'b1;
                mul_en = 1'b0;            
            end
            else if(mul)
            begin
                next_state = 2'b11;
                add_en = 1'b0;
                sub_en = 1'b0;
                mul_en = 1'b1;           
            end
            else
            begin
                next_state = 2'b01;
                add_en = 1'b1;
                sub_en = 1'b0;
                mul_en = 1'b0;
            end 
        end
        2'b10: //sub
        begin
            if(add)
            begin
                next_state = 2'b01;
                add_en = 1'b1;
                sub_en = 1'b0;
                mul_en = 1'b0;
            end
            else if(sub)
            begin
                next_state = 2'b10;
                add_en = 1'b0;
                sub_en = 1'b1;
                mul_en = 1'b0;            
            end
            else if(mul)
            begin
                next_state = 2'b11;
                add_en = 1'b0;
                sub_en = 1'b0;
                mul_en = 1'b1;           
            end
            else
            begin
                next_state = 2'b10;
                add_en = 1'b0;
                sub_en = 1'b1;
                mul_en = 1'b0;
            end 
        end
        2'b11: //mul
        begin
            if(add)
            begin
                next_state = 2'b01;
                add_en = 1'b1;
                sub_en = 1'b0;
                mul_en = 1'b0;
            end
            else if(sub)
            begin
                next_state = 2'b10;
                add_en = 1'b0;
                sub_en = 1'b1;
                mul_en = 1'b0;            
            end
            else if(mul)
            begin
                next_state = 2'b11;
                add_en = 1'b0;
                sub_en = 1'b0;
                mul_en = 1'b1;           
            end
            else
            begin
                next_state = 2'b11;
                add_en = 1'b0;
                sub_en = 1'b0;
                mul_en = 1'b1;
            end 
        end
        default:
        begin
           next_state = 2'b00;
           add_en = 1'b0;
           sub_en = 1'b0;
           mul_en = 1'b0;
        end
        endcase
    
endmodule

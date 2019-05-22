`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/27 14:41:15
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
     push,
     rst,
     clk_d,
     en
    );
    input clk_d;
    input push;
    input rst;
    output reg en;
    reg state;        //0為暫停，1為計時
    reg next_state;
    
    always@( posedge clk_d or posedge rst )
        if(rst)
            state <= 1'b0;
        else
            state <= next_state;
            
    always@(  push )
        case(state)
            1'b0 : 
            if(push)
                next_state <= 1'b1;
             else
                next_state <= 1'b0;
            1'b1 : 
            if(push)
                next_state <= 1'b0;
            else
                next_state <= 1'b1;
            default : 
            next_state <= 1'b0;
        endcase

        always@(state)
            case(state)
            1'b0 : en = 0;
            1'b1 : en = 1;
            default : en = 0;
            endcase    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/10 17:39:53
// Design Name: 
// Module Name: counter_d1
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
    clk_d,
    change,
    rst,
    choose_mode
    );
    input clk_d;
    input change;
    input rst;
    output reg choose_mode;
    reg state;   //0 is month/day , 1 is year
    reg next_state;
    
    initial begin
    state = 1'b1;
    end
    
    always@( posedge clk_d or posedge rst )
        if(rst)
            state <= 1'b0;
        else
            state <= next_state;
    
    
    always@( change or state )
        case(state)
            1'b0 :
            if( change )
                next_state <= 1'b1;
            else
                next_state <= 1'b0;
            1'b1 :
            if( change )
                next_state <= 1'b1;
            else
                next_state <= 1'b0;
            default : 
                next_state <= 1'b0;
        endcase
    
    always@(state)
        case(state)
          1'b0 : choose_mode = 0;
          1'b1 : choose_mode = 1;
          default : choose_mode = 0;
        endcase 
endmodule

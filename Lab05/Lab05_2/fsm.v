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
     one_pulse,
     rst,
     clk_d,
     push,
     rst_2,
     en
    );
    input clk_d;
    input one_pulse;
    input rst;
    input push;
    output reg en;
    output reg rst_2;
    reg [1:0] state;        //0001為計10:return 30
    reg [1:0] next_state;
    reg rst_2_en;
    reg [8:0] push_time;    //若到3則讓數字回到30
    
    initial begin
        push_time = 9'b000_000_000;
    end
    
    always@( posedge clk_d or posedge rst )
        if(rst)
            state <= 2'b00;
        else
            state <= next_state;
    
    always@( posedge clk_d or posedge rst )
        if(rst) begin
            rst_2_en = 1'b0;
            push_time = 9'b000_000_000;
        end
        else if(push_time == 9'b110_000_000) begin
            rst_2_en = 1'b1;
            push_time = 9'b000_000_000;
        end
        else if(push) begin
            rst_2_en = 1'b0;
            push_time = push_time + 1'b1;
        end
        else begin
            rst_2_en = 1'b0;
            push_time = 2'b00 ;
        end    

        
    always@( state or one_pulse or rst_2_en )
        case(state)
            2'b00 : 
                if(rst_2_en)
                    next_state <= 2'b10;        
                else if(one_pulse)
                    next_state <= 2'b01;
                else
                    next_state <= 2'b00;
            2'b01 :
                if(rst_2_en)
                    next_state <= 2'b10;
                else if(one_pulse)
                    next_state <= 2'b00;
                else
                    next_state <= 2'b01;
            2'b10 :
                if(one_pulse)
                    next_state <= 2'b01;
                else
                    next_state <= 2'b10;
            default : next_state <= 2'b00;
        endcase

        always@(state)
            case(state)
            2'b00 : 
            begin
                en = 0;
                rst_2 = 0;
            end
            2'b01 :
            begin
                en = 1;
                rst_2 = 0;
            end
            2'b10 : 
            begin
                en = 0;
                rst_2 = 1;
            end
            default : 
            begin
                en = 0;
                rst_2 = 1;
            end
            endcase    
endmodule

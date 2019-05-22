`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 16:57:02
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
    input clk_100,
    input one_pulse_s,
    input one_pulse_f,
    input rst,
    output reg freeze_en,
    output reg rst_f,
    output reg count_en
    );
    reg [1:0] state;
    reg [1:0] next_state;
    
    always@( posedge clk_100 or posedge rst )
        if(rst)
            state <= 2'b00;
        else
            state <= next_state;
    
    always@*//( posedge one_pulse_s or posedge one_pulse_f )
        case(state)
        2'b00://stop
            if(one_pulse_s)
            begin //stare
                next_state <= 2'b01;
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
            else if(one_pulse_f)
            begin //rst
                next_state <= 2'b11;
                freeze_en = 1'b0;
                rst_f = 1'b1;
                count_en = 1'b0;
            end
            else
            begin //stop
                next_state <= 2'b00;
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b0;
            end
        2'b01://start
            if(one_pulse_s)
            begin //stop
                next_state <= 2'b00;
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b0;
            end
            else if(one_pulse_f)
            begin //freeze
                next_state <= 2'b10;
                freeze_en = 1'b1;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
            else
            begin //start
                next_state <= 2'b01;
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
        2'b10://freeze
            if(one_pulse_s)
            begin // freeze
                next_state <= 2'b10;
                freeze_en = 1'b1;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
            else if(one_pulse_f)
            begin //start
                next_state <= 2'b01;
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b1;            
            end
            else
            begin //freeze
                next_state <= 2'b10;
                freeze_en = 1'b1;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
        2'b11://rst_f
            if(one_pulse_s)
            begin //start
                next_state <= 2'b01;
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
            else if(one_pulse_f)
            begin //rst
                next_state <= 2'b11;
                freeze_en = 1'b0;
                rst_f = 1'b1;
                count_en = 1'b0;
            end
            else
            begin
                next_state <= 2'b11;
                freeze_en = 1'b0;
                rst_f = 1'b1;
                count_en = 1'b0;
            end
        default:
            begin
            next_state <= 2'b00;
            end
        endcase
             
 /*   always@*
        case(state)
            2'b00:
            begin
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b0;
            end
            2'b01:
            begin
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
            2'b10:
            begin
                freeze_en = 1'b1;
                rst_f = 1'b0;
                count_en = 1'b1;
            end
            2'b11:
            begin
                freeze_en = 1'b0;
                rst_f = 1'b1;
                count_en = 1'b0;
            end
            default:
            begin
                freeze_en = 1'b0;
                rst_f = 1'b0;
                count_en = 1'b0;
            end
        endcase
*/
endmodule

`timescale 1ns / 1ps
`define Caps 8'h58
`define Shift_1 8'h12
`define Shift_2 8'h59
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/08 18:53:04
// Design Name: 
// Module Name: Lab08_4
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


module Lab08_4(
    input clk,
    input rst,
    inout PS2_DATA,
    inout PS2_CLK,
    output mini,
    output [6:0] LEDs
    );
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid;
    //wire [1:0] ssd_ctl;
    
    KeyboardDecoder KBD(.key_down(key_down),
                        .last_change(last_change),
                        .key_valid(key_valid),
                        .PS2_DATA(PS2_DATA),
                        .PS2_CLK(PS2_CLK),
                        .rst(rst),
                        .clk(clk)
                        );
    wire shift_en,cap_en;
    //wire mini;
    assign shift_en = (key_down[`Shift_1] | key_down[`Shift_2])? 1'b1 : 1'b0;                    
    assign cap_en = (key_down[`Caps])? 1'b1 : 1'b0;
    
    fsm FSM(.clk(clk),
            .rst(rst),
            .shift_en(shift_en),
            .cap_en(cap_en),
            //.shift(shift),
            .mini(mini)
            );
                                
    decoder DE(.last_change(last_change),
               //.shift(shift),
               .mini(mini),
               .LEDs(LEDs)
               ); 
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/27 15:56:20
// Design Name: 
// Module Name: Lab05_pre
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


module Lab05_1(
     clk_crystal,
     push,
     display,
     display_c,
     rst,
     LEDs
    );
    input clk_crystal;
    input push;
    output [7:0] display;
    output [3:0] display_c;
    input rst;
    output [15:0] LEDs;
    
    wire clk_d;
    wire [1:0] ssd_ctl;
    freq_div FD(.clk_in(clk_crystal),
                .clk_d(clk_d),
                .ssd_ctl(ssd_ctl)
                );
                
     wire en;
     wire decrease;
     wire br0;
     wire [3:0] d0;
     wire [3:0] d1;
     assign decrease = ~(en & (d0==4'b0000) & (d1==4'b0000));
     
     downcounter_d0 D0(.clk_d(clk_d),
                       .en(en),
                       .rst(rst),
                       .decrease(decrease),
                       .d0(d0),
                       .br0(br0),
                       .LEDs(LEDs)
         );
      downcounter_d1 D1(.clk_d(clk_d),
                        .en(en),
                        .rst(rst),
                        .decrease(br0),
                        .d1(d1)
                        );
                        
       fsm FSM(.clk_d(clk_d),
               .rst(rst),
               .push(push),
               .en(en)
               );
       
       wire [7:0] display0;
       wire [7:0] display1;
       SSD_Decoder DC(.d0(d0),
                      .d1(d1),
                      .display0(display0),
                      .display1(display1)
                      );
                      
       SSD_CTL CTL(.display0(display0),
                   .display1(display1),
                   .ssd_ctl(ssd_ctl),
                   .display(display),
                   .display_c(display_c)
                   );               
endmodule

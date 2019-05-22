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


module Lab05_2(
     clk_crystal,
     pb_in,
     display,
     display_c,
     rst,
    // pb_de,
    // one_pulse,
     LEDs
    );
    input clk_crystal;
    input pb_in;
    output [7:0] display;
    output [3:0] display_c;
    input rst;
    output [15:0] LEDs;
    
    wire clk_d;
    wire clk_100;
    wire [1:0] ssd_ctl;
    
    freq_div FD(.clk_in(clk_crystal),
                .clk_d(clk_d),
                .clk_100(clk_100),
                .ssd_ctl(ssd_ctl)
                );
   
     wire pb_de;
     Debounce DB(.clk_100(clk_100),
                 .rst(rst),
                 .pb_in(pb_in),
                 .pb_de(pb_de)
                 );
                 
     wire one_pulse;                 
     One_pulse OP(.clk_100(clk_100),
                  .rst(rst),
                  .pb_de(pb_de),
                  .one_pulse(one_pulse)
                  );
                  
     wire rst_2;
     wire en;
     fsm FSM(.clk_d(clk_100),
             .rst(rst),
             .push(pb_in),   
             .one_pulse(one_pulse),
             .rst_2(rst_2),
             .en(en)
             );
     
     wire decrease;
     wire br0;
     wire [3:0] d0;
     wire [3:0] d1;
     assign decrease = ~(en & (d0==4'b0000) & (d1==4'b0000));
     downcounter_d0 D0(.clk_d(clk_d),
                       .en(en),
                       .rst(rst),
                       .rst_2(rst_2),
                       .decrease(decrease),
                       .d0(d0),
                       .br0(br0),
                       .LEDs(LEDs)
         );
      downcounter_d1 D1(.clk_d(clk_d),
                        .en(en),
                        .rst(rst),
                        .rst_2(rst_2),
                        .decrease(br0),
                        .d1(d1)
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

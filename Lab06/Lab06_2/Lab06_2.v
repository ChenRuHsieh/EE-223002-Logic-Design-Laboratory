`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 15:26:17
// Design Name: 
// Module Name: Lab06_2
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


module Lab06_2(
     clk,
     rst,
     change,
     change_freq,
     display_c,
     display,
     co_d1,
     month_big,
     month_two
    );
    input clk;
    input rst;
    input change;
    input change_freq;
    output [3:0] display_c;
    output [7:0] display;
  //  output co_d1;
    
    wire clk_d;
    wire [1:0] ssd_ctl;
    freq_div FD(.clk(clk),
                .change_freq(change_freq),
                .clk_d(clk_d),
                .ssd_ctl(ssd_ctl)
                );
    
    wire choose_mode;
    fsm FSM(.clk_d(clk_d),
            .rst(rst),
            .change(change),
            .choose_mode(choose_mode)
            );
    
    wire co_min;
    wire co_hr;
    wire co_day;        
    upcounter_60sec SEC(.clk_d(clk_d),
                        .rst(rst),
                        .add_en(1'b1),
                        .co_min(co_min)
                        );
                        
    upcounter_60min MIN(.clk_d(clk_d),
                        .rst(rst),
                        .add_en(co_min),
                        .co_hr(co_hr)
                        );
                        
    upcounter_24hr  HR(.clk_d(clk_d),
                       .rst(rst),
                       .add_en(co_hr),
                       .co_day(co_day)
                       );
    
    wire [3:0] day_d0;
    wire [3:0] day_d1;
    output co_d1;
    wire co_month;
    output month_big;
    output month_two;
    day_d0_counter DAY_D0(.clk_d(clk_d),
                          .rst(rst),
                          .add_en(co_day),
                          .month_big(month_big),
                          .month_two(month_two),
                          .day_d1(day_d1),
                          .day_d0(day_d0),
                          .co_d1(co_d1)
                          );
                          
    day_d1_counter DAY_D1(.clk_d(clk_d),
                          .rst(rst),
                          .add_en(co_d1),
                          .month_big(month_big),
                          .month_two(month_two),
                          .day_d1(day_d1),
                          .co_month(co_month)
                          );
    
    wire [3:0] month_m0;  
    wire [3:0] month_m1;

    wire co_m1;
    wire co_year;                    
    month_m0_counter MON_M0(.clk_d(clk_d),
                            .rst(rst),
                            .add_en(co_month),
                            .month_m1(month_m1),
                            .month_m0(month_m0),
                            .month_big(month_big),
                            .month_two(month_two),
                            .co_m1(co_m1)
                            );
                                                    
    month_m1_counter MON_M1(.clk_d(clk_d),
                            .rst(rst),
                            .add_en(co_m1),
                            .month_m1(month_m1),
                            .co_year(co_year)
                            );
    
    wire [3:0] year_y0; 
    wire [3:0] year_y1;
    wire co_y1;                                         
    year_y0_counter YA_Y0(.clk_d(clk_d),
                          .rst(rst),
                          .add_en(co_year),
               //           .year_y1(year_y1),
                          .year_y0(year_y0),
                          .co_y1(co_y1)
                          );
    
    year_y1_counter YA_Y1(.clk_d(clk_d),
                          .rst(rst),
                          .add_en(co_y1),
                          .year_y1(year_y1)
                          );
    
    wire [3:0] d0;
    wire [3:0] d1;
    wire [3:0] d2;
    wire [3:0] d3;                      
    mode MD(.choose_mode(choose_mode),
            .day_d0(day_d0),
            .day_d1(day_d1),
            .month_m0(month_m0),
            .month_m1(month_m1),
            .year_y0(year_y0),
            .year_y1(year_y1),
            .d0(d0),
            .d1(d1),
            .d2(d2),
            .d3(d3)
            );
     
     wire [7:0] display0;
     wire [7:0] display1;
     wire [7:0] display2;
     wire [7:0] display3;      
     ssd_decoder SSD_DC(.d0(d0),
                        .d1(d1),
                        .d2(d2),
                        .d3(d3),
                        .display0(display0),
                        .display1(display1),
                        .display2(display2),
                        .display3(display3)
                        );
                        
     ssd_ctl SSD_CTL(.display0(display0),
                     .display1(display1),
                     .display2(display2),
                     .display3(display3),
                     .ssd_ctl(ssd_ctl),
                     .display(display),
                     .display_c(display_c)
                     );
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/10 16:51:47
// Design Name: 
// Module Name: Lab06_1
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


module Lab06_1(
     clk_c,
     pb_in,
     rst,
     display,
     display_c,
     am,
     choose_mode
    );
    input clk_c;
    input pb_in;
    input rst;
    output [7:0] display;
    output [3:0] display_c;
    output am;
    output choose_mode;
    
    wire clk_1;
    wire clk_100;
    wire [1:0] ssd_ctl;
    freq_div FD(.clk_in(clk_c),
                .clk_d(clk_1),
                .clk_100(clk_100),
                .ssd_ctl(ssd_ctl)
                );
    
    wire pb_de;            
    debounce DE(.clk_100(clk_100),
                .pb_in(pb_in),
                .rst(rst),
                .pb_de(pb_de)
                );
                
    wire one_pusle;
    one_pulse OP(.clk_100(clk_100),
                 .pb_de(pb_de),
                 .rst(rst),
                 .one_pulse(one_pulse)
                 );
    
               
    fsm FSM(.clk_100(clk_100),
            .one_pulse(one_pulse),
            .rst(rst),
            .choose_mode(choose_mode)
            );
            
    wire co_min;
    upcounter_60sec SEC(.clk_1(clk_1),
                        .rst(rst),
                        .en(1'b1),
                        .co_min(co_min)
                        );
                        
    wire co_hr;
    upcounter_60min MIN(.clk_1(clk_1),
                        .rst(rst),
                        .en(co_min),
                        .co_hr(co_hr)
                        );   
    wire co_24;
    wire [3:0] d0_24;
    wire [3:0] d1_24;      
    counter24_d0 C0_24(.clk_1(clk_1),
                  .rst(rst),
                  .add_en(co_hr),
                  .co(co_24),
                  .d0_24(d0_24),
                  .d1_24(d1_24)
                  );
    
    
    counter24_d1 C1_24(.clk_1(clk_1),
                  .rst(rst),
                  .add_en(co_24),
                  .d1_24(d1_24)
                  );
    
    
    wire [3:0] d0_12;
    wire [3:0] d1_12;
    wire co_12;
    wire am_en;
    wire change_am;
    counter12_d0 C0_12(.clk_1(clk_1),
                       .rst(rst),
                       .add_en(co_hr),
                       .co(co_12),
                       .d0_12(d0_12),
                       .d1_12(d1_12),
                       .change_am(change_am)
                       );
                  
                  
    counter12_d1 C1_12(.clk_1(clk_1),
                       .rst(rst),
                       .add_en(co_12),
                       .d1_12(d1_12)
                       );
    
    
    change_ap AP(.change_am(change_am),
                 .rst(rst),
                 .am_en(am_en)
                 );
                 
    wire [3:0] D0;
    wire [3:0] D1;
    mode MD(.d0_12(d0_12),
            .d1_12(d1_12),
            .d0_24(d0_24),
            .d1_24(d1_24),
            .am_en(am_en),
            .am(am),
            .choose_mode(choose_mode),
            .D0(D0),
            .D1(D1)
            );
            
    wire [7:0] display0;
    wire [7:0] display1;
    ssd_decoder SSD_DC(.d0(D0),
                       .d1(D1),
                       .display0(display0),
                       .display1(display1)
                       );
                       

    ssd_ctl SSD_CTL(.display0(display0),
                    .display1(display1),
                    .ssd_ctl(ssd_ctl),
                    .display(display),
                    .display_c(display_c)
                    );
                       
                       
            
    
endmodule

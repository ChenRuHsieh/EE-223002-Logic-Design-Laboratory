`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/19 14:46:17
// Design Name: 
// Module Name: Lab07_2
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


module Lab07_2(
    input pb_p_hr,
    input pb_s_min,
    input setting,
    input clk,
    input rst,
    /*output de_en,
    output set_en,
    output rst_f,*/
    output reg [15:0] LEDs,
    output [7:0] display,
    output [3:0] display_c
    );
    wire de_en;
    wire set_en;
    wire rst_f;
    
    
    wire clk_d;
    wire clk_f;
    wire [1:0] ssd_ctl;
    freq_div FD(.clk(clk),
                .clk_d(clk_d),
                .clk_f(clk_f),
                .ssd_ctl(ssd_ctl)
                );
    
    wire pb_s_de;
    wire pb_p_de;            
    debounce_s DE_S(.clk_f(clk_f),
                    .pb_s_min(pb_s_min),
                    .rst(rst),
                    .pb_s_de(pb_s_de)
                    );
    debounce_p DE_P(.clk_f(clk_f),
                    .pb_p_hr(pb_p_hr),
                    .rst(rst),
                    .pb_p_de(pb_p_de)
                    );

    wire pb_cs;
    wire pb_cp;            
    debounce_cs DE_CS(.clk_d(clk_d),
                    .pb_s_min(pb_s_min),
                    .rst(rst),
                    .pb_cs(pb_cs)
                    );
    debounce_cp DE_CP(.clk_d(clk_d),
                    .pb_p_hr(pb_p_hr),
                    .rst(rst),
                    .pb_cp(pb_cp)
                    );
     
    wire one_pusle_s;
    wire one_pusle_p;
    one_pulse_s OP_S(.clk_f(clk_f),
                     .pb_s_de(pb_s_de),
                     .rst(rst),
                     .one_pulse_s(one_pulse_s)
                     );
    one_pulse_p OP_P(.clk_f(clk_f),
                     .pb_p_de(pb_p_de),
                     .rst(rst),
                     .one_pulse_p(one_pulse_p)
                     );
    
    wire one_pulse_cs;
    wire one_pulse_cp;                  
    one_pulse_cs OP_CS(.clk_d(clk_d),
                     .pb_cs(pb_cs),
                     .rst(rst),
                     .one_pulse_cs(one_pulse_cs)
                     );
    one_pulse_cp OP_CP(.clk_d(clk_d),
                     .pb_cp(pb_cp),
                     .rst(rst),
                     .one_pulse_cp(one_pulse_cp)
                     );                
                       
    wire [3:0] min_m0;
    wire [3:0] min_m1; 
    wire [3:0] hr_h0;
    wire [3:0] hr_h1; 
    wire LEDs_en;
    wire light;
    assign LEDs_en = min_m0==4'd0 && min_m1==4'd0 && hr_h0==4'd0 && hr_h1==4'd0;
    fsm FSM(.clk_f(clk_f),
            .rst(rst),
            .setting(setting),
            .one_pulse_s(one_pulse_s),
            .one_pulse_p(one_pulse_p),
            .LEDs_en(LEDs_en),
            .rst_f(rst_f),
            .de_en(de_en),
            .set_en(set_en),
            .light(light)
            );                 
    
    always@*
        if(light)
            LEDs <= 16'b1111_1111_1111_1111;
        else
            LEDs <= 16'd0;
            
    wire br_m0;
/*    down_counter_sec SEC(.clk_d(clk_d),
                         .rst(rst),
                         .rst_f(rst_f),
                         .set_en(set_en),
                         .de_en(de_en),
                         .br_m0(br_m0)
                         );*/
    wire co_m1;
    wire co_h1;
    wire [3:0] set_m0,set_m1,set_h0,set_h1;
    setting_m0 S_M0(.clk_d(clk_d),
                    .rst(rst),
                    .set_en(set_en),
                    .one_pulse_min(one_pulse_cs),
                    
                    .set_m0(set_m0),
                    .co_m1(co_m1)
                    );
    setting_m1 S_M1(.clk_d(clk_d),
                    .rst(rst),
                    .set_en(set_en),
                    .co_m1(co_m1),
                    
                    .set_m1(set_m1)
                    );
                    
    setting_h0 S_H0(.clk_d(clk_d),
                    .rst(rst),
                    .set_en(set_en),
                    .one_pulse_hr(one_pulse_cp),
                    .set_h1(set_h1),
                    
                    .set_h0(set_h0),
                    .co_h1(co_h1)
                    );
    
    setting_h1 S_H1(.clk_d(clk_d),
                    .rst(rst),
                    .set_en(set_en),
                    .co_h1(co_h1),
                    
                    .set_h1(set_h1)
                    );
                    
                    
                                  
    /*setting_m1 S_M1(.clk_f(clk_f),
                    .rst(rst),
                    .set_en(set_en),
                    .co_m1(co_m1),
                    //.one_pulse_min(one_pulse_s),
                    //.one_pulse_hr(one_pulse_p),
                    set_m1(set_m1)
                    ); */   
    wire br_m1;
    wire br_h0;
  //  wire co_m1;
    down_counter_m0 M0(.clk_d(clk_d),
                       .rst(rst),
                       .rst_f(rst_f),
                       .set_en(set_en),
                       .de_en(de_en),
                       .br_m0(1'b1),
                       .set_m0(set_m0),
                       
                       .min_m0(min_m0),
                       .br_m1(br_m1)
                       );
                       
    down_counter_m1 M1(.clk_d(clk_d),
                       .rst(rst),
                       .rst_f(rst_f),
                       .set_en(set_en),
                       .de_en(de_en),
                       .br_m1(br_m1),
                       .set_m1(set_m1),
                       
                       .min_m1(min_m1),
                       .br_h0(br_h0)
                       );
    
    wire br_h1;                 
    down_counter_h0 H0(.clk_d(clk_d),
                       .rst(rst),
                       .rst_f(rst_f),
                       .set_en(set_en),
                       .de_en(de_en),
                       .br_h0(br_h0),
                       //.hr_h1(hr_h1),
                       .set_h0(set_h0),
                       
                       .hr_h0(hr_h0),
                       .br_h1(br_h1)
                       );
    down_counter_h1 H1(.clk_d(clk_d),
                       .rst(rst),
                       .rst_f(rst_f),
                       .set_en(set_en),
                       .de_en(de_en),
                       .br_h1(br_h1),
                       .set_h1(set_h1),
                       
                       .hr_h1(hr_h1)
                       );
    
        
    wire [7:0] display0;  
    wire [7:0] display1;
    wire [7:0] display2;
    wire [7:0] display3;                 
    ssd_decoder SSD_DC(.min_m0(min_m0),  
                       .min_m1(min_m1),            
                       .hr_h0(hr_h0),
                       .hr_h1(hr_h1),
                       .display0(display0),
                       .display1(display1),
                       .display2(display2),
                       .display3(display3)
                       );
     
    
    ssd_control SSD_CTL(.ssd_ctl(ssd_ctl),
                        .display0(display0),
                        .display1(display1),
                        .display2(display2),
                        .display3(display3),
                        .display(display),
                        .display_c(display_c)
                        );   
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/04 18:38:10
// Design Name: 
// Module Name: La08_3
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
//////////////////////////////////////////////////////////////////////////////////


module Lab08_3(
    input clk,
    input rst,
    inout PS2_DATA,
    inout PS2_CLK,
    output [7:0] display,
    output [3:0] display_c,
    output add_en,sub_en,mul_en
    );
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid;
    wire [1:0] ssd_ctl;
    
    make_ssd_ctl MSC(.clk(clk),
                  //   .rst(rst),
                     .ssd_ctl(ssd_ctl)
                     );
    
    KeyboardDecoder KBD(.key_down(key_down),
                        .last_change(last_change),
                        .key_valid(key_valid),
                        .PS2_DATA(PS2_DATA),
                        .PS2_CLK(PS2_CLK),
                        .rst(rst),
                        .clk(clk)
                        );
           
    assign add = (key_down[8'h79])? 1'b1 : 1'b0;
    assign sub = (key_down[8'h7B])? 1'b1 : 1'b0;
    assign mul = (key_down[8'h7C])? 1'b1 : 1'b0;
    //wire add_en,sub_en,mul_en;
    fsm FSM(.clk(clk),
            .rst(rst),
            .add(add),
            .sub(sub),
            .mul(mul),
            .add_en(add_en),
            .sub_en(sub_en),
            .mul_en(mul_en)
            );
    
    wire [3:0] last_change_b;                   
    transform TF(.last_change(last_change),
                 .last_change_b(last_change_b)
                 ); 
                 
    wire tf_en;
    wire [3:0] store_s0,store_s1,store_s2,store_s3;
    assign tf_en = key_down[8'h70] || key_down[8'h69] || key_down[8'h72] || key_down[8'h7A] 
                || key_down[8'h6B] || key_down[8'h73] || key_down[8'h74] || key_down[8'h6C]
                || key_down[8'h75] || key_down[8'h7D];                   
    store ST(.last_change_b(last_change_b),
             .rst(rst),
             .tf_en(tf_en),
             .store_s0(store_s0),
             .store_s1(store_s1), 
             .store_s2(store_s2), 
             .store_s3(store_s3)
             );
    
    wire [3:0] add_a0,add_a1,add_a2,add_a3;
    wire [3:0] sub_s0,sub_s1,sub_s2,sub_s3;
    wire [3:0] mul_m0,mul_m1,mul_m2,mul_m3;
    adder AD(.clk(clk),
             .rst(rst),
             .store_s0(store_s0),
             .store_s1(store_s1), 
             .store_s2(store_s2), 
             .store_s3(store_s3),
             .add_a0(add_a0),
             .add_a1(add_a1),
             .add_a2(add_a2),
             .add_a3(add_a3)
             );
    suber SB(.clk(clk),
             .rst(rst),
             .store_s0(store_s0),
             .store_s1(store_s1), 
             .store_s2(store_s2), 
             .store_s3(store_s3),
             .sub_s0(sub_s0),
             .sub_s1(sub_s1),
             .sub_s2(sub_s2),
             .sub_s3(sub_s3)
             );
    muler MU(.clk(clk),
             .rst(rst),
             .store_s0(store_s0),
             .store_s1(store_s1), 
             .store_s2(store_s2), 
             .store_s3(store_s3),
             .mul_m0(mul_m0),
             .mul_m1(mul_m1),
             .mul_m2(mul_m2),
             .mul_m3(mul_m3)
             );
    wire [3:0] d0,d1,d2,d3;
    wire result_en = (key_down[8'h5A])? 1'b1 : 1'b0;         
    select_value SE(.add_en(add_en),.sub_en(sub_en),.mul_en(mul_en),.result_en(result_en),
                    .store_s0(store_s0),.store_s1(store_s1),.store_s2(store_s2),.store_s3(store_s3),
                    .add_a0(add_a0),.add_a1(add_a1),.add_a2(add_a2),.add_a3(add_a3),
                    .sub_s0(sub_s0),.sub_s1(sub_s1),.sub_s2(sub_s2),.sub_s3(sub_s3),
                    .mul_m0(mul_m0),.mul_m1(mul_m1),.mul_m2(mul_m2),.mul_m3(mul_m3),
                    .d0(d0),.d1(d1),.d2(d2),.d3(d3)
                    ); 
                              
    wire [7:0] dis0,dis1,dis2,dis3;
    ssd_decoder SSD_DC(.d0(d0),
                       .d1(d1),
                       .d2(d2),
                       .d3(d3),
                       .dis0(dis0),
                       .dis1(dis1),
                       .dis2(dis2),
                       .dis3(dis3)
                       );                        
    ssd_ctl SSD_CTL(.dis0(dis0),
                    .dis1(dis1),
                    .dis2(dis2),
                    .dis3(dis3),
                    .ssd_ctl(ssd_ctl),
                    .display(display),
                    .display_c(display_c)
                    );
endmodule

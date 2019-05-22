`timescale 1ns / 1ps

module Lab08_2(
    input clk,
    input rst,
    inout PS2_DATA,
    inout PS2_CLK,
    output [7:0] display,
    output [3:0] display_c
   // output refresh_en
    );
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid;
    wire [1:0] ssd_ctl;
    
    make_ssd_ctl MSC(.clk(clk),
                     //.rst(rst),
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
    
    wire tf_en;
    assign tf_en = key_down[8'h45] || key_down[8'h16] || key_down[8'h1E] || key_down[8'h26] 
                 ||key_down[8'h25] || key_down[8'h2E] || key_down[8'h36] || key_down[8'h3D]
                 ||key_down[8'h3E] || key_down[8'h46];
                
    wire [3:0] last_change_b;                   
    transform TF(.last_change(last_change),
                 .last_change_b(last_change_b)
                 );
                 
    wire [3:0] aug,adden;
    store ST(.last_change_b(last_change_b),
             .tf_en(tf_en),
             .aug(aug),
             .adden(adden)
             );
    
    wire [3:0] d0,d1;         
    adder AD(.clk(clk),
             .rst(rst),
             .aug(aug),
             .adden(adden),
             .d0(d0),
             .d1(d1)
             );
    
    wire [7:0] dis0,dis1,dis2,dis3;
    ssd_decoder SSD_DC(.d0(d0),
                       .d1(d1),
                       .aug(aug),
                       .adden(adden),
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/05 14:20:36
// Design Name: 
// Module Name: Debounce
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


module debounce_cs(
     clk_d,
     rst,
     pb_s_min,
     //pb_f,
     pb_cs
//pb_f_de
    );
    input clk_d;
    input rst;
    input pb_s_min;
   // input pb_f;
    output reg pb_cs;
   // output reg pb_f_de;
    
    reg [3:0] debounce_window_cs;
   // reg [3:0] debounce_window_f;
    reg pb_cs_de_next;
  //  reg pb_f_de_next;  
    
    initial begin
        debounce_window_cs = 4'b0000;
        pb_cs = 1'b0;
    //    debounce_window_f = 4'b0000;
   //     pb_f_de = 1'b0;
    end
    
    always@( posedge clk_d or posedge rst)
        if(rst)
        begin
            debounce_window_cs <= 4'b0000;
     //       debounce_window_f <= 4'b0000;
        end
        else
        begin
            debounce_window_cs <= {debounce_window_cs[2:0],pb_s_min};
     //       debounce_window_f <= {debounce_window_f[2:0],pb_f};
        end 
            
    always@*//s
        if(debounce_window_cs == 4'b1111)
            pb_cs_de_next <= 1'b1;
        else
            pb_cs_de_next <= 1'b0;
     
   /*  always@/f
        if(debounce_window_f == 4'b1111)
            pb_f_de_next <= 1'b1;
        else
            pb_f_de_next <= 1'b0;
         */
     always@( posedge clk_d or posedge rst)
        if(rst)
        begin
            pb_cs <= 1'b0;
           // pb_f_de <= 1'b0;
        end
        else
        begin
            pb_cs <= pb_cs_de_next;
          //  pb_f_de <= pb_f_de_next;
        end

endmodule

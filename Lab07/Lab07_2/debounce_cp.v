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


module debounce_cp(
     clk_d,
     rst,
   //  pb_s,
     pb_p_hr,
   //  pb_s_de,
     pb_cp
    );
    input clk_d;
    input rst;
  //  input pb_s;
    input pb_p_hr;
  //  output reg pb_s_de;
    output reg pb_cp;
    
   // reg [3:0] debounce_window_s;
    reg [3:0] debounce_window_cp;
  //  reg pb_s_de_next;
    reg pb_cp_de_next;  
    
    initial begin
   //     debounce_window_s = 4'b0000;
  //      pb_s_de = 1'b0;
        debounce_window_cp = 4'b0000;
        pb_cp = 1'b0;
    end
    
    always@( posedge clk_d or posedge rst)
        if(rst)
        begin
    //        debounce_window_s <= 4'b0000;
            debounce_window_cp <= 4'b0000;
        end
        else
        begin
     //       debounce_window_s <= {debounce_window_s[2:0],pb_s};
            debounce_window_cp <= {debounce_window_cp[2:0],pb_p_hr};
        end 
            
   /* always@*
        if(debounce_window_s == 4'b1111)
            pb_s_de_next <= 1'b1;
        else
            pb_s_de_next <= 1'b0;
     */
     always@*//f
        if(debounce_window_cp == 4'b1111)
            pb_cp_de_next <= 1'b1;
        else
            pb_cp_de_next <= 1'b0;
            
     always@( posedge clk_d or posedge rst)
        if(rst)
        begin
  //          pb_s_de <= 1'b0;
            pb_cp <= 1'b0;
        end
        else
        begin
   //         pb_s_de <= pb_s_de_next;
            pb_cp <= pb_cp_de_next;
        end

endmodule

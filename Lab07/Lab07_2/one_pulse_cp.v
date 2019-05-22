`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/05 14:10:00
// Design Name: 
// Module Name: One_pulse
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


module one_pulse_cp(
     clk_d,
     pb_cp,
  //   pb_f_de,
     one_pulse_cp,
 //    one_pulse_f,
     rst
    );
    input clk_d;
    input pb_cp;
  //  input pb_f_de;
    input rst;
    output reg one_pulse_cp;
  //  output reg one_pulse_f;
    reg pb_cp_de_delay;
  //  reg pb_f_de_delay;
    

    
    always@( posedge clk_d or posedge rst )
        if(rst)
        begin
            pb_cp_de_delay <= 1'b0;
   //         pb_f_de_delay <= 1'b0;
        end
        else
        begin
            pb_cp_de_delay <= pb_cp;
    //        pb_f_de_delay <= pb_f_de;
        end
    
    assign one_pulse_cp_next = pb_cp & (~pb_cp_de_delay);
  //  assign one_pulse_f_next = pb_f_de & (~pb_f_de_delay);
    
    always@( posedge clk_d or posedge rst )
        if(rst)
        begin
            one_pulse_cp <= 1'b0;
     //       one_pulse_f <= 1'b0;
        end
        else
        begin 
            one_pulse_cp <= one_pulse_cp_next;
    //        one_pulse_f <= one_pulse_f_next;
        end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/13 16:59:36
// Design Name: 
// Module Name: Lab03_2
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


module Lab03_2(
    input  f_crystal,
    output reg f_out,
    input  rst

    );
    reg [26:0] cnt;
    
 
    
    initial
    begin
    f_out = 0;
    cnt   = 0;
    end
    
    /*always@(posedge f_crystal)
        cnt_tmp = cnt + 1'b1;*/
    
    always@(posedge f_crystal or posedge rst)
        if(rst)
            begin
            cnt   <= 0;
            f_out <= 0;
            end
        else
            begin
            if(cnt == 50000000)
            begin
            cnt   <= 0;
            f_out <= ~f_out;
            end
            
            else
            cnt = cnt + 1'b1;
            
            end    
    /*always@(posedge f_crystal)
        if(cnt == 50)
        begin
        cnt <= 0;
        f_out <= ~f_out;
        end*/       
         
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/13 19:04:20
// Design Name: 
// Module Name: bcd_counter
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


module Lab03_3_1(
    input  rst,
    input  clk_crystal,
    /*output reg  [26:0] cnt,
    output reg  [3:0] q,
    output reg  clk_out,*/
    output reg [7:0] display
    );
    reg  [3:0] q;
    reg  [26:0] cnt;
    reg  clk_out;
  
    
    initial begin
    cnt   = 0;
    clk_out = 0;
    q = 0;
    end
    
    always@(posedge clk_crystal or posedge rst)
    begin
        if(rst)
        begin
            cnt <= 27'b0;
        end
        else if (cnt == 50000000)
        begin
            cnt <= 0;
            clk_out <= ~clk_out;
        end
        else
            cnt <= cnt + 1;
    end
    //1Hzªºclk
    /*always@(cnt)
    begin
        if( cnt == 50000000)
        begin
            cnt <= 0;
            clk_out = ~clk_out;
        end    
    end*/
    //BCD counter

    always@(posedge clk_out or posedge rst)
    begin
        if(rst)
            q <= 4'b0;
        else if( q == 9 )
            q <= 4'b0;
        else
            q <= q + 1;
    end       
    
    always@(q)
        case(q)
        4'd0 : display = 8'b00000011; //0
        4'd1 : display = 8'b10011111; //1
        4'd2 : display = 8'b00100101; //2
        4'd3 : display = 8'b00001101; //3
        4'd4 : display = 8'b10011001; //4
        4'd5 : display = 8'b01001001; //5
        4'd6 : display = 8'b01000001 ; //6
        4'd7 : display = 8'b00011111 ; //7
        4'd8 : display = 8'b00000001 ; //8
        4'd9 : display = 8'b00001001; //9
        default : display = 8'b01110001; //F
        endcase
endmodule

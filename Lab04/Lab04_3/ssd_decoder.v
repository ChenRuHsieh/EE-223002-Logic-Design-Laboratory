`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/20 18:31:02
// Design Name: 
// Module Name: ssd_decoder
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


module ssd_decoder(
     d0,
     d1,
     d2,
     d3,
     display0,
     display1,
     display2,
     display3
    );
    input [2:0] d0;
    input [2:0] d1;
    input [2:0] d2;
    input [2:0] d3;
    output reg [7:0] display0;
    output reg [7:0] display1;
    output reg [7:0] display2;
    output reg [7:0] display3;
    
    always@(d0)
        case(d0)
        3'b000 :  display0 = 8'b11010101;    //N 
        3'b001 :  display0 = 8'b11100001;    //T
        3'b010 :  display0 = 8'b10010001;    //H
        3'b011 :  display0 = 8'b10000011;    //U
        3'b100 :  display0 = 8'b01100001;    //E
        default : display0 = 8'b1;
        endcase
        
     always@(d1)
         case(d1)
         3'b000 :  display1 = 8'b11010101;    //N 
         3'b001 :  display1 = 8'b11100001;    //T
         3'b010 :  display1 = 8'b10010001;    //H
         3'b011 :  display1 = 8'b10000011;    //U
         3'b100 :  display1 = 8'b01100001;    //E
         default : display1 = 8'b11111111;
         endcase
               
     always@(d2)
          case(d2)
          3'b000 :  display2 = 8'b11010101;    //N 
          3'b001 :  display2 = 8'b11100001;    //T
          3'b010 :  display2 = 8'b10010001;    //H
          3'b011 :  display2 = 8'b10000011;    //U
          3'b100 :  display2 = 8'b01100001;    //E
          default : display2 = 8'b11111111;
          endcase
          
     always@(d3)
          case(d3)
          3'b000 :  display3 = 8'b11010101;    //N 
          3'b001 :  display3 = 8'b11100001;    //T
          3'b010 :  display3 = 8'b10010001;    //H
          3'b011 :  display3 = 8'b10000011;    //U
          3'b100 :  display3 = 8'b01100001;    //E
          default : display3 = 8'b11111111;
          endcase
                                  
endmodule

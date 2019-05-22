`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/24 18:26:20
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
    input [8:0] last_change,
    //output refresh_en,
    output reg [7:0] d0
    );
    wire [7:0] value;
  //  wire refresh_en;
    assign value = last_change[7:0];
    assign refresh_en = (last_change==8'h1B) || (last_change==8'h1C) || (last_change==8'h3A) || (last_change==8'h5A);
    always@*
        begin
            case(value)
            8'h45: d0 <= 8'b00000011; //0
            8'h16: d0 <= 8'b10011111; //1
            8'h1E: d0 <= 8'b00100101; //2
            8'h26: d0 <= 8'b00001101; //3
            8'h25: d0 <= 8'b10011001; //4
            8'h2E: d0 <= 8'b01001001; //5
            8'h36: d0 <= 8'b01000001; //6
            8'h3D: d0 <= 8'b00011111; //7
            8'h3E: d0 <= 8'b00000001; //8
            8'h46: d0 <= 8'b00001001; //9
            8'h1C: d0 <= 8'b00010001; //A
            8'h1B: d0 <= 8'b01001001; //S
            9'h3A: d0 <= 8'b11010101; //M
            9'h5A: d0 <= 8'b11111110; //refresh .
            default: d0 <= 8'b01110001;
            endcase
        end
endmodule

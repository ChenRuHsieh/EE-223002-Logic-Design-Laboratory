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
    input [3:0] d0,
    input [3:0] d1,
    input [3:0] d2,
    input [3:0] d3,
    output reg [7:0] dis0,
    output reg [7:0] dis1,
    output reg [7:0] dis2,
    output reg [7:0] dis3
        );
    
    always@*
    begin
        case(d0)
        4'd0: dis0 <= 8'b00000011; //0
        4'd1: dis0 <= 8'b10011111; //1
        4'd2: dis0 <= 8'b00100101; //2
        4'd3: dis0 <= 8'b00001101; //3
        4'd4: dis0 <= 8'b10011001; //4
        4'd5: dis0 <= 8'b01001001; //5
        4'd6: dis0 <= 8'b01000001; //6
        4'd7: dis0 <= 8'b00011111; //7
        4'd8: dis0 <= 8'b00000001; //8
        4'd9: dis0 <= 8'b00001001; //9
        default: dis0 = 8'b1111_1110;
        endcase
    end
    
    always@*
    begin
        case(d1)
        4'd0: dis1 = 8'b00000011; //0
        4'd1: dis1 = 8'b10011111; //1
        4'd2: dis1 = 8'b00100101; //2
        4'd3: dis1 = 8'b00001101; //3
        4'd4: dis1 = 8'b10011001; //4
        4'd5: dis1 = 8'b01001001; //5
        4'd6: dis1 = 8'b01000001; //6
        4'd7: dis1 = 8'b00011111; //7
        4'd8: dis1 = 8'b00000001; //8
        4'd9: dis1 = 8'b00001001; //9
        default: dis1 = 8'b1111_1110;
        endcase
    end
    
    always@*
    begin
        case(d2)
        4'd0: dis2 = 8'b00000011; //0
        4'd1: dis2 = 8'b10011111; //1
        4'd2: dis2 = 8'b00100101; //2
        4'd3: dis2 = 8'b00001101; //3
        4'd4: dis2 = 8'b10011001; //4
        4'd5: dis2 = 8'b01001001; //5
        4'd6: dis2 = 8'b01000001; //6
        4'd7: dis2 = 8'b00011111; //7
        4'd8: dis2 = 8'b00000001; //8
        4'd9: dis2 = 8'b00001001; //9
        default: dis2 = 8'b1111_1110;
        endcase
    end
    
    always@*
    begin
        case(d3)
        4'd0: dis3 = 8'b00000011; //0
        4'd1: dis3 = 8'b10011111; //1
        4'd2: dis3 = 8'b00100101; //2
        4'd3: dis3 = 8'b00001101; //3
        4'd4: dis3 = 8'b10011001; //4
        4'd5: dis3 = 8'b01001001; //5
        4'd6: dis3 = 8'b01000001; //6
        4'd7: dis3 = 8'b00011111; //7
        4'd8: dis3 = 8'b00000001; //8
        4'd9: dis3 = 8'b00001001; //9
        4'd15 : dis3 = 8'b11111101;
        default: dis3 = 8'b1111_1110;
        endcase
    end    
endmodule

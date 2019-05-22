`timescale 1ns / 1ps
`define A 8'h1C
`define B 8'h32
`define C 8'h21
`define D 8'h23
`define E 8'h24
`define F 8'h2B
`define G 8'h34
`define H 8'h33
`define I 8'h43
`define J 8'h3B
`define K 8'h42
`define L 8'h4B
`define M 8'h3A
`define N 8'h31
`define O 8'h44
`define P 8'h4D
`define Q 8'h15
`define R 8'h2D
`define S 8'h1B
`define T 8'h2C
`define U 8'h3C
`define V 8'h2A
`define W 8'h1D
`define X 8'h22
`define Y 8'h35
`define Z 8'h1A

`define ASCII_A 7'd65
`define ASCII_B 7'd66
`define ASCII_C 7'd67
`define ASCII_D 7'd68
`define ASCII_E 7'd69
`define ASCII_F 7'd70
`define ASCII_G 7'd71
`define ASCII_H 7'd72
`define ASCII_I 7'd73
`define ASCII_J 7'd74
`define ASCII_K 7'd75
`define ASCII_L 7'd76
`define ASCII_M 7'd77
`define ASCII_N 7'd78
`define ASCII_O 7'd79
`define ASCII_P 7'd80
`define ASCII_Q 7'd81
`define ASCII_R 7'd82
`define ASCII_S 7'd83
`define ASCII_T 7'd84
`define ASCII_U 7'd85
`define ASCII_V 7'd86
`define ASCII_W 7'd87
`define ASCII_X 7'd88
`define ASCII_Y 7'd89
`define ASCII_Z 7'd90

`define ASCII_a 7'd97
`define ASCII_b 7'd98
`define ASCII_c 7'd99
`define ASCII_d 7'd100
`define ASCII_e 7'd101
`define ASCII_f 7'd102
`define ASCII_g 7'd103
`define ASCII_h 7'd104
`define ASCII_i 7'd105
`define ASCII_j 7'd106
`define ASCII_k 7'd107
`define ASCII_l 7'd108
`define ASCII_m 7'd109
`define ASCII_n 7'd110
`define ASCII_o 7'd111
`define ASCII_p 7'd112
`define ASCII_q 7'd113
`define ASCII_r 7'd114
`define ASCII_s 7'd115
`define ASCII_t 7'd116
`define ASCII_u 7'd117
`define ASCII_v 7'd118
`define ASCII_w 7'd119
`define ASCII_x 7'd120
`define ASCII_y 7'd121
`define ASCII_z 7'd122

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/08 19:21:09
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [8:0] last_change,
    //input shift,
    input mini,
    output reg [6:0] LEDs
    );
    wire [7:0] value;
    assign value = last_change[7:0];
    always@*
        case(value)
        `A : LEDs = (mini)? `ASCII_a :`ASCII_A;
        `B : LEDs = (mini)? `ASCII_b :`ASCII_B;
        `C : LEDs = (mini)? `ASCII_c :`ASCII_C;
        `D : LEDs = (mini)? `ASCII_d :`ASCII_D;
        `E : LEDs = (mini)? `ASCII_e :`ASCII_E;
        `F : LEDs = (mini)? `ASCII_f :`ASCII_F;
        `G : LEDs = (mini)? `ASCII_g :`ASCII_G;
        `H : LEDs = (mini)? `ASCII_h :`ASCII_H;
        `I : LEDs = (mini)? `ASCII_i :`ASCII_I;        
        `J : LEDs = (mini)? `ASCII_j :`ASCII_J;
        `K : LEDs = (mini)? `ASCII_k :`ASCII_K;
        `L : LEDs = (mini)? `ASCII_l :`ASCII_L;
        `M : LEDs = (mini)? `ASCII_m :`ASCII_M;
        `N : LEDs = (mini)? `ASCII_n :`ASCII_N;
        `O : LEDs = (mini)? `ASCII_o :`ASCII_O;
        `P : LEDs = (mini)? `ASCII_p :`ASCII_P;
        `Q : LEDs = (mini)? `ASCII_q :`ASCII_Q;
        `R : LEDs = (mini)? `ASCII_r :`ASCII_R;
        `S : LEDs = (mini)? `ASCII_s :`ASCII_S;
        `T : LEDs = (mini)? `ASCII_t :`ASCII_T;
        `U : LEDs = (mini)? `ASCII_u :`ASCII_U;
        `V : LEDs = (mini)? `ASCII_v :`ASCII_V;
        `W : LEDs = (mini)? `ASCII_w :`ASCII_W;
        `X : LEDs = (mini)? `ASCII_x :`ASCII_X;
        `Y : LEDs = (mini)? `ASCII_y :`ASCII_Y;
        `Z : LEDs = (mini)? `ASCII_z :`ASCII_Z;
        default : LEDs = 7'd0;
        endcase
endmodule

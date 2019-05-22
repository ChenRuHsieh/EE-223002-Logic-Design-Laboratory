`timescale 1ns / 1ps


module shifter(
     q,
     clk,
     rst
    );
    output reg [7:0] q;
    input  clk;
    input  rst;
    
    initial
    begin
        q <= 8'b01010101;
    end
    
    always@( posedge clk or posedge rst )
    begin
        if( rst )
            q <= 8'b01010101;
        else
        begin
            q[0] <= q[7];
            q[1] <= q[0];
            q[2] <= q[1];
            q[3] <= q[2];
            q[4] <= q[3];
            q[5] <= q[4];
            q[6] <= q[5];
            q[7] <= q[6];
        end
    end
        
endmodule

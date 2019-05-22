`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/18 23:01:33
// Design Name: 
// Module Name: shifter
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


module shifter(
      clk,
      rst,
      d0,
      d1,
      d2,
      d3
    );
    input  clk;
    input  rst;
    output [2:0] d0;
    output [2:0] d1;
    output [2:0] d2;
    output [2:0] d3;
    reg [17:0] nthuee;
    
    initial
    begin
    nthuee = 18'b000_001_010_011_100_100;
    end
    
    
    assign d3 = nthuee[17:15];
    assign d2 = nthuee[14:12];
    assign d1 = nthuee[11:9];
    assign d0 = nthuee[8:6];
    
    
    always@( posedge clk or posedge rst )
    begin
    if(rst)
        begin
            nthuee <= 18'b000_001_010_011_100_100;
        end
    else
        begin
            nthuee <= {nthuee[14:0],nthuee[17:15]};
        end
    end
    
endmodule

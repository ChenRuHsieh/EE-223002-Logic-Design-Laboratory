`timescale 1ns / 1ps


module freq_div(
     clk_in,
     rst,
     clk_out
    );
    input  clk_in;
    input  rst;
    output reg clk_out;
    reg [27:0] cnt,cnt_tmp;
    
    initial 
    begin
        cnt <= 27'b0;
        clk_out <= 1'b0;
    end
    
    always@( cnt )
        cnt_tmp <= cnt + 1;
        
    always@( posedge clk_in or posedge rst )
    begin
        if(rst)
            cnt <= 27'b0;
        else if( cnt == 50000000 )
        begin
            clk_out <= ~clk_out;
            cnt <= 27'b0;
        end
        else
            cnt <= cnt_tmp;
    end
    

endmodule

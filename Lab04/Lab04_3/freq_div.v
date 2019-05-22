`timescale 1ns / 1ps


module freq_div(
     clk_in,
     //rst,
     clk_out,
     ssd_ctl
    );
    input  clk_in;
    //input  rst;
    output reg clk_out;
    output [1:0] ssd_ctl;
    reg [26:0] cnt;
    
    initial 
    begin
        cnt <= 27'b0;
        clk_out <= 1'b0;
    end
    
    assign ssd_ctl = cnt[20:19];
    

        
    always@( posedge clk_in  )
    begin
       if ( cnt == 50_000_000 ) begin
            cnt <= 27'b0;
            clk_out <= ~clk_out;
            end
        else
            cnt <= cnt + 1;
    end
    
endmodule

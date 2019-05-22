`timescale 1ns / 1ps


module freq_div(
     clk_in,
     clk_d,
     clk_100,
     ssd_ctl
    );
    input  clk_in;
    output reg clk_d;
    output reg clk_100;
    output [1:0] ssd_ctl;
    reg [26:0] cnt;
    reg [26:0] cnt_500K;
    
    initial 
    begin
        cnt = 27'b0;
        cnt_500K = 27'b0;
        clk_d = 1'b0;
        clk_100 = 1'b0;
    end
    
    assign ssd_ctl = cnt[20:19];
    
    always@( posedge clk_in  ) //100Hz
    begin
       if ( cnt_500K == 500_000 ) begin
            cnt_500K <= 27'b0;
            clk_100 <= ~clk_100;
            end
        else
            cnt_500K <= cnt_500K + 1;
    end
        
    always@( posedge clk_in  ) //1Hz
    begin
       if ( cnt == 50_000_000 ) begin
            cnt <= 27'b0;
            clk_d <= ~clk_d;
            end
        else
            cnt <= cnt + 1;
    end
    
endmodule

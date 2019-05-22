`timescale 1ns / 1ps


module freq_div(
     clk,
     clk_d,
     change_freq,
     ssd_ctl
    );
    input  clk;
    output reg clk_d;
    input change_freq;
    output [1:0] ssd_ctl;
    reg [26:0] cnt;
    reg [26:0] cnt_ssd;
    reg [26:0] cnt_month;
    
    initial 
    begin
        cnt = 27'b0;
      //  cnt_500K = 27'b0;
        clk_d = 1'b0;
       // clk_100 = 1'b0;
    end
    
    assign ssd_ctl = cnt_ssd[17:16];
    
    always@( posedge clk  ) 
    begin
       if ( cnt_ssd == 50_000_000 ) begin
            cnt_ssd <= 27'b0;
           // clk_ssd <= ~clk_ssd;
            end
        else
            cnt_ssd <= cnt_ssd + 1'b1;
    end
        
    always@( posedge clk  ) 
    if(change_freq)
    begin
        if( cnt_month == 17 ) //1 month
        begin
            cnt_month <= 27'b0;
            clk_d <= ~clk_d;
        end
        else
            cnt_month <= cnt_month + 1'b1;
    end
    else    
    begin //1000*4*25Hz=1 day
        if ( cnt == 170 ) begin //50000/(4*25)=500 => 1 day
            cnt <= 27'b0;
            clk_d <= ~clk_d;
            end
        else
            cnt <= cnt + 1;
    end
    
endmodule

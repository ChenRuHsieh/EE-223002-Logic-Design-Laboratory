`timescale 1ns / 1ps

module down_counter_sec(
    input clk_d,
    input rst,
    input rst_f,
    input set_en,
    input de_en,
    output reg br_m0
    );
    reg [7:0] cnt_sec;
    reg [7:0] cnt_sec_tmp;

    always@( posedge clk_d or posedge rst or posedge rst_f )
        if(rst || rst_f)
            cnt_sec <= 8'd0;
        else
            cnt_sec <= cnt_sec_tmp;
     
     always@*
        if( set_en )
        begin
            cnt_sec_tmp <= 8'd0;
        end
        else if( cnt_sec==8'd0 && de_en )
        begin //00->59
            cnt_sec_tmp <= 8'd59;
            br_m0 <= 1'b1;
        end
        else if(de_en) 
        begin
            cnt_sec_tmp <= cnt_sec - 1'b1;
            br_m0 <= 1'b0;
        end
        else
        begin
            cnt_sec_tmp <= cnt_sec;
        end

endmodule
`timescale 1ns / 1ps

module down_counter_h0(
    input clk_d,
    input rst,
    input rst_f,
    input set_en,
    input de_en,
    input br_h0,
    //input [3:0] hr_h1,
    input [3:0] set_h0,
    
    output reg [3:0] hr_h0,
    output reg br_h1
    );
    //reg [3:0] hr_h0_set;
    reg [3:0] hr_h0_de;
    //reg [3:0] hr_h0_set_tmp;
   // reg [3:0] hr_h0_de_tmp;
    
    always@( posedge clk_d or posedge rst or posedge rst_f or posedge set_en )
        if( rst || rst_f )
            hr_h0 <= 4'd0;
        else if(set_en)
            hr_h0 <= set_h0;
        else
            hr_h0 <= hr_h0_de;
        
    always@*
        if(de_en) //decrease
        begin
            if( hr_h0==4'd0 && br_h0)
            begin //20->19
                hr_h0_de = 4'd9;
                br_h1 = 1'b1;
            end
            else if( br_h0 ) //19->18
            begin
                hr_h0_de = hr_h0 - 1'b1;
                br_h1 = 1'b0;
            end
            else
            begin
                hr_h0_de = hr_h0;
                br_h1 = 1'b0;
            end
        end
        else //pause
        begin
            hr_h0_de = hr_h0;
        end
    
  /*  always@(posedge clk_f or posedge rst)
        if(rst)
        begin
            hr_h0_set <= 4'd0;
            hr_h0_de <= 4'd0; 
        end
        else
        begin
            hr_h0_set <= hr_h0_set_tmp;
            hr_h0_de <= hr_h0_de_tmp;
        end*/
         
endmodule
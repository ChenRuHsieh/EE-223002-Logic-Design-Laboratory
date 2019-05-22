`timescale 1ns / 1ps

module down_counter_m0(
    input clk_d,
    input rst,
    input rst_f,
    input set_en,
    input de_en,
    input br_m0,
    input [3:0] set_m0,
    
    output reg [3:0] min_m0,
    output reg br_m1
    );
    //reg [3:0] min_m0_set;
    reg [3:0] min_m0_de;
  //  reg [3:0] min_m0_set_tmp;
   // reg [3:0] min_m0_de_tmp;
    
    always@( posedge clk_d or posedge rst or posedge rst_f or posedge set_en )
        if( rst || rst_f )
            min_m0 <= 4'd0;
        else if(set_en)
            min_m0 <= set_m0;
        else
            min_m0 <= min_m0_de;
            
  /* always@(posedge clk_d or posedge rst)
                 if(rst)
                 begin
                    min_m0_set <= 4'd0;
                    min_m0_de <= 4'd0; 
                 end
                 else
                 begin
                     min_m0_set <= min_m0_set_tmp;
                     min_m0_de <= min_m0_de_tmp;*/
                // end
    always@*//( set_en or min_m0 or pb_s_min or min_m0_set or co_m1 or min_m0_de or br_m1  )   
        if(de_en) //decrease
        begin
            if( min_m0==4'd0 && br_m0)
            begin //50->49
                min_m0_de = 4'd9;
                br_m1 = 1'b1;
            end
            else if( br_m0 ) //49->48
            begin
                min_m0_de = min_m0 - 1'b1;
                br_m1 = 1'b0;
            end
            else
            begin
                min_m0_de = min_m0;
                br_m1 = 1'b0;
            end
        end
        else //pause
        begin
            min_m0_de = min_m0;
        end
        
 
         
endmodule
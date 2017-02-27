//`timescale 1ps/1ps
module alu(input [31:0] data1, data2, signextend_result, EX_MEM_data3,  MEM_WB_data3, 
           input [2:0]       controlline,
           input [1:0]       ForwardA, ForwardB,
           input             ALUSrc, RegDst,
           input [4:0] rt,rd,
         //  output            zero,
           output reg [31:0] aluresult, rtresult,
           output  [4:0] desreg
           );
    reg    [31:0]               alusource1, alusource2;
    
    always @ (*)
      begin
          rtresult  = (ForwardB[1]) ? ((ForwardB[0]) ? 'dz : EX_MEM_data3)
                                    : ((ForwardB[0]) ? MEM_WB_data3 : data2);
          
          alusource1 = (ForwardA[1]) ? ((ForwardA[0]) ? 'dz : EX_MEM_data3)
                                     : ((ForwardA[0]) ? MEM_WB_data3 : data1);
          
          alusource2 = (ALUSrc)? signextend_result : rtresult; 
      end
    
               
    always @ (*)
      begin
         case (controlline)
            3'b000:    aluresult = alusource1 & alusource2;
            3'b001:  aluresult = alusource1 | alusource2;
            3'b010:   aluresult = alusource1 + alusource2;
            3'b110:  aluresult = alusource1 - alusource2;
            3'b111:  aluresult = (alusource1 < alusource2)? 1:0;
            default:  aluresult = 'd0;
               
          endcase // case (controlline)
            //  #100 zero = (alusource2 == alusource1)? 1:0;
              
             
      end // always @ (*)
    assign desreg = (RegDst) ? rd : rt;
    
   // assign #100 zero = (alusource1 == alusource2)? 1:0;
endmodule // alu

            
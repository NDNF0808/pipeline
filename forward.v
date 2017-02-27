module Forward(input  EX_MEM_RegWrite, MEM_WB_RegWrite, MEM_WB_MemtoReg, EX_MEM_MemWrite,ID_EX_RegWrite,
               input [4:0]   desreg1,   desreg2, ID_EX_registerRs, ID_EX_registerRt, desreg3, IF_ID_registerRs, IF_ID_registerRt,
               output reg  [1:0] ForwardA, ForwardB, ForwardD, ForwardE,
               output  reg      ForwardC
               );
    always @ (*)
      begin
      ///////////////////////////////EX阶段转发///////////////////////////////////
          if(EX_MEM_RegWrite && (desreg2 != 'd0) && (desreg2 == ID_EX_registerRs))
            ForwardA = 2'b10;
          else if(MEM_WB_RegWrite  && (desreg3!= 'd0) && (desreg3 == ID_EX_registerRs) && ~(EX_MEM_RegWrite && (desreg2 != 'd0) && (desreg2 == ID_EX_registerRs)))
            ForwardA = 2'b01;
          else
            ForwardA = 2'b00;
          
          if(EX_MEM_RegWrite && (desreg2 != 'd0) && (desreg2 == ID_EX_registerRt))
            ForwardB = 2'b10;
         else if (MEM_WB_RegWrite  && (desreg3 !='d0) && (desreg3 == ID_EX_registerRt) && ~ (EX_MEM_RegWrite && (desreg2 != 'd0) && (desreg2 == ID_EX_registerRt)))                
            ForwardB = 2'b01;
          else
            ForwardB = 2'b00;
          //////////////////////////ＭＥＭ阶段转发　　LW  SW ///////////////////////////////
          if (MEM_WB_MemtoReg &&  EX_MEM_MemWrite && desreg3 != 'd0 &&  desreg3 == desreg2)//
            ForwardC = 1'b1;
          else
            ForwardC = 1'b0;
          //对于LW ＳＷ的冲突，只用转发既可以完成，由于ＷＢ阶段只剩下信号　MEmtoReg 和RegWrite所以不像冲突检测中一样判断ＬＷ使用MEmRead
          ///////////////////////ID段相等判断的转发//////////////////////////////
          if(ID_EX_RegWrite && (desreg1 != 'd0) && desreg1 == IF_ID_registerRs)
            ForwardD = 2'b10;
          else if(EX_MEM_RegWrite && ( desreg2 != 'd0) && (desreg2 == IF_ID_registerRs) && ~(ID_EX_RegWrite && (desreg1 != 'd0) && (desreg1 == IF_ID_registerRs)))
            
            ForwardD = 2'b01;
          else
            ForwardD = 2'b00;
          if(ID_EX_RegWrite && (desreg1 != 'd0) && desreg1 == IF_ID_registerRt)
            ForwardE = 2'b10;
          else if(EX_MEM_RegWrite && (desreg2 != 'd0) && (desreg2 == IF_ID_registerRt) && ~(ID_EX_RegWrite && (desreg1 != 'd0) && (desreg1 == IF_ID_registerRt)))
              
            ForwardE = 2'b01;
          else
            ForwardE = 2'b00;
          
          
  
      end // always @ (*)
endmodule // Forward

          
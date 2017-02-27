module hazarddetection(input ID_EX_MemtoReg, EX_MEM_MemtoReg, 
                       input [5:0] opcode,
                       input [4:0] ID_EX_registerRt , IF_ID_registerRs, IF_ID_registerRt,EX_MEM_registerRt, 
                       output reg  PcWrite, IF_ID_write, stall
);
    always @ (*)
      begin
          if ( (ID_EX_MemtoReg && (ID_EX_registerRt != 'd0) && ((ID_EX_registerRt == IF_ID_registerRs) ||(ID_EX_registerRt  == IF_ID_registerRt)) && ((opcode == 6'b000100) || (opcode == 6'b000000)))      ||      (EX_MEM_MemtoReg && (EX_MEM_registerRt != 'd0) && ((EX_MEM_registerRt == IF_ID_registerRs) ||(EX_MEM_registerRt  == IF_ID_registerRt)) && (opcode == 6'b000100) )                  ||   (ID_EX_MemtoReg && (ID_EX_registerRt != 'd0) && (ID_EX_registerRt == IF_ID_registerRs)  && (opcode == 6'b101011))  )
            begin
                stall = 1'b1;
                PcWrite = 1'b0;
                IF_ID_write = 1'b0;
            end
          else
            begin
                IF_ID_write = 1'b1;
                stall = 1'b0;
                PcWrite = 1'b1;
            end
      end // always @ (*)
    
          
endmodule // hazarddetection

                              
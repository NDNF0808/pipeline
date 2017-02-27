module branchprediction(input [1:0] predictionbuffer,
                        input [31:0] ins,
                        output reg predict
                      // output [1:0] predictionbufferout          
                        );
    always @ (*)
      if (ins[31:26] == 6'b000100)
      begin
          if (predictionbuffer == 2'b00 || predictionbuffer == 2'b01)
            begin
                predict = 1'b0;
               // PcWrite = 1'b1;
            end
                
          else
            begin
                predict = 1'b1;
                //PcWrite = 1'b0;
            end // UNMATCHED !!
      end // if (ins[31:26] == 6'b000100)
      else
        predict = 1'b0;
    
endmodule // branchprediction
/////应该被调用而不是硬件连线实现
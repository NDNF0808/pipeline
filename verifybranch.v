module verifybranch(input zero,  Branch, reset,
                   input [5:0] opcode,
                   input [1:0]  predictionbufferin,
                   input        predict,
                   output reg  [1:0] predictionbufferout,
                    output reg flush
                    
                    );
    wire                            pcsrc;
    assign pcsrc = zero & Branch;
 
    always @ (*)
      if(opcode == 6'b000100)
        begin
            if(pcsrc)
              begin
                  if(predictionbufferin == 2'b00)
                    predictionbufferout = 2'b01;
                  else
                    predictionbufferout = 2'b11;
              end
            else
              begin
                  if (predictionbufferin == 2'b11)
                    predictionbufferout = 2'b10;
                  else
                    predictionbufferout = 2'b00;
              end // else: !if( branchequal)
        end // always @ (*)
    always @ (*)
      if (opcode == 6'b000100)
      begin
          if (pcsrc == predict)
            flush = 1'b0;
          else
            flush = 1'b1;
      end
      else
        flush = 1'b0;
    
    
        //end // if (opcode == 6'b000100)
    always @ (posedge reset)
      predictionbufferout <= 2'b11;
    
    
            
endmodule // verifybranch

    
      
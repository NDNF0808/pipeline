module pc(
          input [31:0]    ins,  pcaddr,pcaddr2, branchaddr, jumpaddr, branch_addr2,
          input [5:0] opcode,
          input          flush, clk, reset, PcWrite, predict1, zero, Branch,
         // output reg        flush,
          output reg [31:0] pcvalue);
   wire               pcsrc ;
    
  assign pcsrc = zero & Branch;
   // reg          [31:0]      prepc;
    
    always @ (posedge reset)
      pcvalue = 32'b0;
    
         
    always @(posedge clk)
      if (PcWrite)
      begin
/*       multiplexer(    .a(branchaddr),
                                            .b(pcaddr),
                                             .y(prepc),
                                            .s(pcsrc)
                                            );
          
          multiplexer(.a(jumpaddr),
                                         .b(prepc),
                                         .y(pcvalue),
                                         .s(jump)
                                         );
 always 语句中不能调用模块
 */
/*     assign prepc = pcsrc? branchaddr : pcaddr;
          assign pcvalue = jump ? jumpaddr : prepc;
  不行，因为assign语句是并行执行的
 */        
          
     //    prepc <= (pcsrc) ? branchaddr : pcaddr;
       //   pcvalue <= (jump)?  jumpaddr : prepc;
          
  
          
      
//if(jump)
  //pcvalue <= jumpaddr;
          
          if (opcode == 6'b000100 && flush == 1'b1)
                  if(pcsrc)
                    pcvalue <= branch_addr2 ;
                  else
                    pcvalue <= pcaddr2;
          else 
            begin
                if( predict1)
                  pcvalue <= branchaddr;
               // else if(jump)
                 // pcvalue <= jumpaddr;
                else if(ins[31:26] == 6'b000010)
                  pcvalue <= jumpaddr;
                else
                  
                  pcvalue <= pcaddr;
            end // else: !if(opcode == 6'b000010)
          
    
          


end // always @ (posedge clk)
    
endmodule // pc

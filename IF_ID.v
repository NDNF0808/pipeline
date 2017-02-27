module IF_ID(input clk, IF_ID_write, predict,
             input             flush,
             input [31:0]      ins, branchaddr1,pcaddr1,
             input [31:0]      signextendresult,
             input [1:0]       predictionbuffer,
             output reg [5:0]  opcode, funct,
             output reg [4:0]  rs, rt, rd, shamt,
             output reg [15:0] immediate,
             output reg [25:0] addr26,
             output reg [31:0] signextendresult1,
             output reg        predict1,
             output reg  [31:0] branchaddr2,pcaddr2,
             output reg [1:0]  predictionbuffer1
            // output [31:0]     pcaddr2
             );
    reg [31:0]                       a;
   // reg [31:0]                       pcaddr;
    
    
    
    
    always @ (posedge clk)
      begin
          
          if (IF_ID_write)
            // begin
            //   a <= ins;
            //     pcaddr <= pcaddr1;
            // jumpaddr <= jumpaddr1;
            
            //  end
            //  always @ (*)
            if (flush)
              begin
                  opcode <= 'd0;
                  funct <= 'd0;
                  rs <= 'd0;
                  rt <= 'd0;
                  rd <= 'd0;
                  shamt <= 'd0;
                  immediate <= 'd0;
                  addr26 <= 'd0;
                  signextendresult1 <= 'd0;
                  predict1 <= 'd0;
                  predictionbuffer1 <= 'd0;
                  branchaddr2 <= 'd0;
                  pcaddr2 <= 'd0;
                  
              end
            else
              
            begin
                opcode <= ins[31:26];
                funct <= ins[5:0];
                rs <= ins[25:21];
                rt <= ins[20:16];
                rd <= ins[15:11];
                shamt <= ins[10:6];
                immediate <= ins[15:0];
                addr26 <= ins[25:0];
                signextendresult1 <= signextendresult;
                predict1 <= predict;
                predictionbuffer1 <= predictionbuffer;
                branchaddr2 <= branchaddr1;
                pcaddr2 <= pcaddr1;
                
                
                
                //   pcaddr2 = pcaddr;
                // jumpaddr2 = jumpaddr;
                
                
            end // if (IF_ID_write)
      end // always @ (posedge clk)
    
endmodule


      

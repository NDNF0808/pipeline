//`timescale 1ps/1ps
module im(input [31:0] pcvalue,
          output reg  [31:0] ins
          );
    reg [31:0]              iram [2**16 -1:0];
    initial
      begin
          $readmemh("imem.txt", iram, 0,28);
      end
  //  always @ (posedge clk)
      
 always @ (*)
   ins = iram[pcvalue];
      
    endmodule
    
    
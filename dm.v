//`timescale 1ps/1ps
module dm(input [31:0] aluresult, rtresult, MEM_WB_data5,
          input clk, MemWrite,   MemRead, ForwardC,
          output reg [31:0] readdate 
          //   output [25:0] address
          );
    reg [31:0]              dram [2**16-1:0];
    wire [31:0]             b;
    assign b = (ForwardC) ?  MEM_WB_data5 : rtresult;
 
   initial
      begin
          $readmemh("dmem.txt", dram, 0,300 );
      end
    always @ (posedge clk)
      if (MemWrite)
      dram[aluresult] <= b;
    always @ (*)
      begin
          if (MemRead)
         readdate = dram[aluresult];
          //result = (MemtoReg) ? readdate : aluresult;
      end
   
endmodule

 
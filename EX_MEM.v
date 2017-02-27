module EX_MEM (
              // input [31;0]      aluresult1,rtresult1,
               input [31:0] aluresult1, rtresult1,
               input [4:0]       desreg1,
               input             clk,
               input             MemRead, MemWrite, MemtoReg, Regwrite1,
               output reg [31:0] aluresult2, rtresult2,
               output reg [4:0]  desreg2,
               output reg        MemRead2, MemWrite2, MemtoReg2, Regwrite2

              );
    always @ (posedge clk)
      begin
          aluresult2 <= aluresult1;
          rtresult2 <= rtresult1;
          desreg2 <= desreg1;
          MemRead2 <= MemRead;
          MemWrite2 <= MemWrite;
          MemtoReg2 <= MemtoReg;
          Regwrite2 <= Regwrite1;
      end
endmodule // EX_MEM

          
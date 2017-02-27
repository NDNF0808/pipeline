module MEM_WB (input [31:0] readdate1, aluresult2,
               input [4:0]   desreg2,
               input clk,
               input         Memtoreg3, Regwrite3,
               output reg [31:0] readdate2, aluresult3,
               output reg  [4:0]  desreg3,
               output   reg      Memtoreg4, Regwrite4
               );
    always @ (posedge clk)
      begin
          readdate2 <= readdate1;
          aluresult3 <= aluresult2;
          desreg3 <= desreg2;
          Memtoreg4 <= Memtoreg3;
          Regwrite4 <= Regwrite3;
      end
endmodule // MEM_WB

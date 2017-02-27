//`timescale 1ps/1ps
module regfile(input [4:0] rs, rt, writereg,
               input         clk,
               input          RegWrite, 
               input [31:0]  writedate,
               output reg  [31:0] data1, data2
               );
    //reg [31:0]               mem [2**5-1:0];
    
    //wire            [4:0]         writereg;
    reg [31:0]               regf [2**5-1:0];
    
    //assign  writereg = (RegDst)? rd : rt;
    initial
      begin
          $readmemh("regfile.txt", regf, 0, 31);
      end
    
 
    always @ (posedge clk)
          if (RegWrite)
            regf[writereg] <= writedate;
 assign #50   data1 = (rs != 0)? regf [rs] : 0;
 assign #50   data2 = (rt != 0) ? regf [rt] : 0;
endmodule // regfile

    
        
`timescale 1ps/1ps
module bigcontrol(input [5:0] opcode,
                  output reg  [1:0] ALUOP,
                  output   reg    RegDst, Branch1,MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, jump
                  );
    always @ (*)
      begin
          RegDst = & (~opcode);
          ALUSrc = ( opcode[0] & opcode[1] & opcode[5] & ~opcode[2] & ~opcode[3] & ~opcode[4]) | (opcode[0] & opcode[1] & opcode[3] & opcode[5] & ~opcode[2] & ~opcode[4]) | (opcode[3] & ~opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[4] & ~opcode[5]);

          MemtoReg =  opcode[0] & opcode[1] & opcode[5] & ~opcode[2] & ~opcode[3] & ~opcode[4];
          RegWrite =  (opcode[0] & opcode[1] & opcode[5] & ~opcode[2] & ~opcode[3] & ~opcode[4] )| (& (~opcode))| (opcode[3] & ~opcode[0] & ~opcode[1] & ~opcode[2] & ~opcode[4] & ~opcode[5]);
          MemRead =   opcode[0] & opcode[1] & opcode[5] & ~opcode[2] & ~opcode[3] & ~opcode[4];
          MemWrite =  (opcode[0] & opcode[1] & opcode[3] & opcode[5] & ~opcode[2] & ~opcode[4]);
          Branch1 = opcode[2] & ~opcode[0] & ~opcode[1] & ~opcode[3] & ~opcode[4] & ~opcode[5] ;
          ALUOP[1] = & (~opcode);
          ALUOP[0] = opcode[2] & ~opcode[0] & ~opcode[1] & ~opcode[3] & ~opcode[4] & ~opcode[5] ;
          jump = opcode[1] & ~opcode[0] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5];
          
      end // always @ (*)
endmodule // bigcontrol
 
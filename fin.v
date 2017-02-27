module fin(input [31:0] readdate, aluresult,
           input Memtoreg,
           output reg  [31:0] writedata 
);
    //assign writedata = (MemtoReg) ? readdate : aluresult;
    always @ (*)
      writedata = (Memtoreg) ? readdate : aluresult;
    
endmodule // fin

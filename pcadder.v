//`timescale 1ps/1ps
module pcadder(input [31:0] pcvalue,
               //input [25:0] addr26,
               output reg  [31:0] pcaddr1);
    always @ (*)
      begin 
          pcaddr1 = pcvalue + 1;
          //jumpaddr1 = { pcaddr1[31:28], addr26, 2'b0 };
          
      end
    
endmodule // pcadder
   
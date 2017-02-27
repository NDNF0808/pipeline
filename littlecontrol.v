//`timescale 1ps/1ps
module littlecontrol(input [1:0] aluop,
                     input [31:0] signextendresult2,
                     output reg  [2:0] controlline
                     );
    wire [5:0]                         a;
    assign a = signextendresult2[5:0];
 
    always @ (*)
      begin
          
          controlline[2] = (a[1] & aluop[1]) | aluop[0];
          controlline[1] = ~a[2]| ~aluop[1];
          controlline[0] = (a[0] | a[3]) & aluop[1];
      end
    
endmodule // littlecontrol

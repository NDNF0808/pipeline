//`timescale 1ps/1ps

module signextend(input [31:0] ins, 
                  output [31:0] signextendresult);
    wire [15:0]                 immediate;
    assign immediate = ins[15:0];
    
    assign signextendresult = {{16{immediate[15]}},immediate};
endmodule // signextend
 
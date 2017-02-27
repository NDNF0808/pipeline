//`timescale 1ps/1ps
module branchadder(input [31:0] signextendresult, pcaddr2,
                   input [31:0]  ins,
                   output [31:0] branchaddr, jumpaddr);
    wire [25:0]                  add26;
    assign add26 = ins[25:0];
    
    assign branchaddr = pcaddr2 + (signextendresult<<2);
    assign jumpaddr = {pcaddr2[31:28], add26,2'b0};
    
endmodule // branchadder

module compare(input [31:0] data1, data2,aluresult1, aluresult2,
               input [1:0] ForwardD, ForwardE,
               output zero
               );
    wire [31:0]       compare1, compare2;
    assign compare1 = ForwardD[1] ? (ForwardD[0] ? 'dz : aluresult1) : (ForwardD[0] ? aluresult2 : data1);
    assign compare2 = ForwardE[1] ? (ForwardE[0] ? 'dz : aluresult1) : (ForwardE[0] ? aluresult2 : data2);
    assign zero = (compare2 == compare1) ? 1:0;
   endmodule
 
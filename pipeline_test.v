`include "./pipeline.v"
//module test;
module test;
    
    reg clk, reset;
    initial
      begin
          #0 reset = 0;
          #4 reset = ~ reset;
          #1 reset = ~ reset;
          
      end 
    initial
      begin
          #0 clk = 0;
          repeat(135)
            #4 clk = ~clk;
      end
    
    
    pipeline pipeline(clk, reset);
    initial
      begin
          $dumpfile("pipeline.vcd");
          $dumpvars(0,test);
      end
endmodule // test



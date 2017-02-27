module ID_EX(input [31:0] signextendresult1, data1,data2, 
             input [4:0]   rs1, rt1, rd1,
             input         clk, RegDst1, Alusrc1, Memread1, Memwrite1, Regwrite1, Memtoreg1, stall,
             input [1:0]   Aluop1,
             output  reg [31:0] signextendresult2, data21,data22, 
             output reg  [4:0]   rs2, rt2, rd2,
             output     reg     RegDst2, Alusrc2, Memread2, Memwrite2, Regwrite2, Memtoreg2,
             output reg [1:0]   Aluop2

             );
    always @ (posedge clk)
      begin
          if (! stall)
            begin
                signextendresult2 <= signextendresult1;
                data21 <= data1;
                data22 <= data2;
                rs2 <= rs1;
                rt2 <= rt1;
                rd2 <= rd1;
                RegDst2 <= RegDst1;
                Alusrc2 <= Alusrc1;
                // Branch2 <= Branch1;
                Memread2 <= Memread1;
                Memwrite2 <= Memwrite1;
                Regwrite2 <= Regwrite1;
                Memtoreg2 <= Memtoreg1;
                Aluop2 <= Aluop1;
            end // always @ (posedge clk)
          else
            begin 
                signextendresult2 <= 'd0;
                data21 <= 'd0;
                data22 <= 'd0;
                rs2 <= 'd0;
                rt2 <= 'd0;
                rd2 <= 'd0;
                RegDst2 <= 'd0;
                Alusrc2 <= 'd0;
                // Branch2 <= Branch1;
                Memread2 <= 'd0;
                Memwrite2 <= 'd0;
                Regwrite2 <= 'd0;
                Memtoreg2 <= 'd0;
                Aluop2 <= 'd0;

            end // else: !if(! stall)
      end // always @ (posedge clk)
    
                
endmodule // ID_EX

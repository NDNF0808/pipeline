`include "./pc.v"
`include "./pcadder.v"
`include "./IF_ID.v"
`include "./im.v"
`include "./regfile.v"
`include "./signextend.v"
`include "./branchadder.v"
`include "./compare.v"
`include "./branchprediction.v"
`include "./ID_EX.v"
`include "./bigcontrol.v"
`include "./alu.v"
`include "./littlecontrol.v"
`include "./EX_MEM.v"
`include "./forward.v"
`include "./dm.v"
`include "./MEM_WB.v"
`include "./fin.v"
`include "./hazarddetection.v"
`include "./verifybranch.v"
module pipeline( input clk, reset
                 );
    wire [31:0]  pc_addr1,pc_addr2, branch_addr,branch_addr2, jumpaddr, pc_value, in_s, write_date, data_1, data_2,data2_1, data2_2, signextendresult_1,signextendresult_2, signextendresult_3,aluresult1,aluresult2, aluresult3, rtresult1, rtresult2, readdate1,readdate2;
    wire         jump,predic_t, predic_t1, ze_ro,  Pc_Write, RegWrite_1, RegWrite_2, RegWrite_3, RegWrite_4, RegDst_1, RegDst_2, Alusrc_1, Alusrc_2,  Branch_1, Memread_1, Memread_2, Memread_3, Memwrite_1, Memwrite_2, Memwrite_3, Memtoreg_1, Memtoreg_2, Memtoreg_3, Memtoreg_4, ForwardC , IF_ID_write, stall, flush;
    wire [25:0]  addr_26;
    wire [5:0]   op_code, func_t;
    wire [4:0]   rs1, rs2,rt1,rt2, rd1,rd2, sham_t, write_reg, desreg1, desreg2, desreg3;
    wire [15:0] immediat_e;
    wire [1:0]  ForwardD, ForwardE, ForwardA, ForwardB, Aluop_1, Aluop_2, prediction_buffer1, prediction_buffer2;
    wire [2:0]  controlline;
    
    
    
    
    
    pc pc ( in_s, pc_addr1,pc_addr2, branch_addr,jumpaddr,branch_addr2, op_code, flush, clk, reset,  Pc_Write, predic_t,  ze_ro, Branch_1, pc_value);
    
    pcadder pcadder(pc_value, pc_addr1);
    
   IF_ID  IF_ID(clk, IF_ID_write, predic_t, flush, in_s, branch_addr, pc_addr1, signextendresult_1, prediction_buffer1,   op_code, func_t, rs1, rt1,rd1, sham_t, immediat_e, addr_26 , signextendresult_2, predic_t1,branch_addr2,pc_addr2, prediction_buffer2);
    
   im im(pc_value, in_s);
    
    regfile regfile(rs1, rt1, desreg3, clk, RegWrite_4, write_date, data_1, data_2);
    
   signextend signextend(in_s, signextendresult_1);
    
   branchadder branchadder(signextendresult_1, pc_addr1,in_s, branch_addr, jumpaddr);
    
   compare compare(data_1, data_2, aluresult1, aluresult2, ForwardD, ForwardE, ze_ro);
    
    ID_EX ID_EX(signextendresult_2, data_1, data_2, rs1, rt1, rd1, clk, RegDst_1,Alusrc_1, Memread_1, Memwrite_1, RegWrite_1, Memtoreg_1,stall,  Aluop_1,signextendresult_3,data2_1, data2_2, rs2,rt2,rd2,RegDst_2,Alusrc_2, Memread_2, Memwrite_2, RegWrite_2, Memtoreg_2,  Aluop_2 );
    
    
    bigcontrol bigcontrol(op_code, Aluop_1, RegDst_1, Branch_1, Memread_1, Memtoreg_1, Memwrite_1, Alusrc_1,RegWrite_1,jump);
    
   alu alu(data2_1, data2_2, signextendresult_3, aluresult2, write_date, controlline, ForwardA, ForwardB, Alusrc_2, RegDst_2, rt2, rd2, aluresult1, rtresult1, desreg1);
    
    littlecontrol littlecontrol(Aluop_2, signextendresult_3, controlline);
    
   EX_MEM EX_MEM (aluresult1, rtresult1, desreg1, clk, Memread_2, Memwrite_2,Memtoreg_2, RegWrite_2, aluresult2, rtresult2, desreg2, Memread_3, Memwrite_3, Memtoreg_3, RegWrite_3 );
    
    Forward Forward(RegWrite_3, RegWrite_4, Memtoreg_4, Memwrite_3,RegWrite_2, desreg1, desreg2, rs2,rt2,desreg3, rs1,rt1, ForwardA, ForwardB, ForwardD, ForwardE, ForwardC );
    
    dm dm(aluresult2, rtresult2, write_date, clk, Memwrite_3, Memread_3,ForwardC, readdate1);
    
   MEM_WB MEM_WB(readdate1, aluresult2, desreg2, clk, Memtoreg_3, RegWrite_3, readdate2, aluresult3, desreg3, Memtoreg_4, RegWrite_4);
    
   fin fin (  readdate2, aluresult3, Memtoreg_4, write_date);
    
    hazarddetection hazarddetection(Memtoreg_2, Memtoreg_3,  op_code,  rt2, rs1, rt1, desreg2, Pc_Write, IF_ID_write, stall );
    
    branchprediction branchprediction(prediction_buffer1,  in_s, predic_t);
    
    verifybranch verifybranch(ze_ro,Branch_1,  reset, op_code, prediction_buffer2, predic_t1, prediction_buffer1, flush);
endmodule // pipeline

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    
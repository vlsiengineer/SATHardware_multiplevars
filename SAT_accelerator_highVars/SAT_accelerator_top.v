module SAT_accelerator_top (outCNF,clk,resetN,stateVal,varPos1,varPos2,negCtrl1,negCtrl2);

output outCNF;
input clk, resetN;
input [1:0] stateVal;
input [4:0] varPos1,varPos2;
input negCtrl1,negCtrl2;

wire ResetN_Clause, ResetN_CNF, Clause_En, CNF_En;

SAT_synchronizer U1( .ResetN_Clause(ResetN_Clause), .ResetN_CNF(ResetN_CNF), .Clause_En(Clause_En), .CNF_En(CNF_En), .clk(clk), .resetN(resetN), .stateVal(stateVal));

SAT_accelerator U2( .outCNF(outCNF), .clk(clk), .resetClause(ResetN_Clause), .negCtrl1(negCtrl1),.negCtrl2(negCtrl2), .enableClause(Clause_En), .varPos1(varPos1),.varPos2(varPos2), .resetCNF(ResetN_CNF), .enableCNF(CNF_En));

endmodule
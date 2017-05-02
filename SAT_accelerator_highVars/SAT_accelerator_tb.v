 //----------------------------------------------------------

`timescale 1 ns / 100 ps

module SAT_accelerator_tb ();

reg clk,resetClause,negCtrl,enableClause,resetCNF,enableCNF;
reg [4:0] varPos;

wire CNF_out;

 SAT_accelerator U1 (.outCNF(CNF_out),
 .clk(clk),
 .resetClause(resetClause),
 .negCtrl(negCtrl),
 .enableClause(enableClause),
 .varPos(varPos),
 .resetCNF(resetCNF),
 .enableCNF(enableCNF) 
 );
 //----------------------------------------------------------
 
 always
 #10 clk = ~clk;
 
 initial
 begin
 
 clk = 1'b0;
 
 resetClause = 1'b0;
 resetCNF = 1'b0;
 
 varPos = 5'd1;
 negCtrl = 1'b0;
 
 #200
 enableClause = 1'b1;  
 resetClause = 1'b1;

 #500

 enableCNF = 1'b1;  
 resetCNF = 1'b1;
 
 #500
 
 resetCNF = 1'b0;
 
 
 end
 
 endmodule
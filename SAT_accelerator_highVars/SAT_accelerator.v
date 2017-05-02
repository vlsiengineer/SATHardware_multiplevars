module SAT_accelerator(outCNF,clk,resetClause,negCtrl,enableClause,varPos,resetCNF,enableCNF);

output reg outCNF;  
input clk,resetClause,enableClause;
input [5:0] negCtrl;
input unsigned[3:0] varPos[5:0];
input resetCNF,enableCNF;

reg[15:0] accTruthVal = 16'd6;
reg clauseOut;
wire[6:0] inORgate;
wire[1:0] inANDgate;

genvar i;
generate
for (i=0;i<6;i=i+1) begin : geenrate_ORgate
assign inORgate[i] = negCtrl[i]?(~accTruthVal[varPos[i]]):(accTruthVal[varPos[i]]);
end
endgenerate

assign inORgate[6] = clauseOut;

assign inANDgate[0] = clauseOut;
assign inANDgate[1] = outCNF;

always@(posedge clk or negedge resetClause)
begin

if(~resetClause) begin
clauseOut <= 1'b0;
end

else if(enableClause) begin
clauseOut <= |inORgate;
end

end

always@(posedge clk or negedge resetCNF)
begin

if(~resetCNF) begin
outCNF <= 1'b1;
end

else if(enableCNF) begin
outCNF <= &inANDgate;
end

end

endmodule
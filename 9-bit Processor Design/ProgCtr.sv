module ProgCtr(
  input             Clk,
                    Reset,
					Branch,
  input  logic[11:0] Jump,
  output logic[11:0] PC,
  output logic done);

  always_ff @(posedge Clk)
    if(Reset)begin  PC <= 'b0; done=0; end
	else if(Branch)begin if(Jump == 12'b000000000000) done=1; else PC <= (Jump-12'b000000000001); end
	else      PC <= PC + 6'd1;

endmodule
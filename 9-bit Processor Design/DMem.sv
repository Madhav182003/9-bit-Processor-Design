module DMem(
  input Clk,
        Wen,
  input[7:0] WDat, //RdatA from RegFile
             Addr, //Rslt of ALU
  output logic[7:0] Rdat);

  logic[7:0] core[256];

  always_ff @(posedge Clk)
    if(Wen) core[Addr] <= WDat;

  assign Rdat = core[Addr];

endmodule






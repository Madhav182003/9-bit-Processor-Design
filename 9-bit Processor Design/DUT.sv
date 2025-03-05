module DUT(
  input        Clk,
		       Reset,
  output logic Done);

  wire[11:0] Jump,
	        PC;
  wire[3:0] Aluop;
  wire [2:0] Ra,
			Rb,
			Wd;
  wire [4:0] addr;
  wire[8:0] mach_code;
  wire[7:0] DatA,	     // ALU data in
            DatB,
			Rslt,		 // ALU data out
			RdatA,		 // RF data out
			RdatB,
			WdatR,		 // RF data in
			WdatD,		 // DM data in
			Rdat,		 // DM data out
			Addr,
      Immediate;		 // DM address
  wire      Branch, C, L, Z, F,	 // PC jump enable
            LessThan,         // ALU parity flag
			SCo,         // ALU shift/carry out
            Zero,        // ALU zero flag
			AddFlag,
      WenR,		 // RF write enable
			WenD,		 // DM write enable
      MemToReg,
      D1sel,
      D2sel;
// assign  DatA = RdatA;
// assign  DatB = RdatB; 
// assign  WdatR = Rslt; 

assign addr = mach_code[4:0]; 

JLUT J1(
  .Clk(Clk),
  .Reset(Reset),
  .addr(addr),
  .Jump(Jump)
);

ProgCtr PC1(
  .Clk,
  .Reset,
  .Branch(Branch),
  .Jump(Jump),
  .PC,
  .done(Done));

InstROM IR1(
  .PC,
  .mach_code
  );

FlagsReg FR1(
  .Clk,
  .C(SCo),
  .Reset,
  .Z(Z),
  .L(L),
  .F(F),
  .Carry(C),
  .LessThan(LessThan),
  .Zero(Zero),
  .AddFlag(AddFlag)
);

Ctrl C1(
  .mach_code,
  .Zero(Zero),
  .LessThan(LessThan),
  .AddFlag(AddFlag),
  .Aluop(Aluop),
  .Branch(Branch),
  .Ra(Ra),
  .Rb(Rb),
  .Wd(Wd),
  .WenR(WenR),
  .WenD(WenD),
  .MemToReg(MemToReg),
  .D1sel(D1sel),
  .D2sel(D2sel),
  .Immediate(Immediate)
  );

RegFile RF1(
  .Clk,
  .Wen(WenR),
  .Reset,
  .Ra(Ra),
  .Rb(Rb),
  .Wd(Wd),
  .Wdat(WdatR),
  .RdatA(RdatA),
  .RdatB(RdatB)
);

ALUD1MUX ADM1(
  .D1sel(D1sel),
  .RdatA(RdatA),
  .RdatB(RdatB),
  .ALUD1(DatA)
);

ALUD2MUX ADM2(
  .D2sel(D2sel),
  .RdatB(RdatB),
  .Immediate(Immediate),
  .ALUD2(DatB)
);

ALU A1(
  .Aluop(Aluop),
  .DatA(DatA),
  .DatB(DatB),
  .CarryIn(C),
  .Z(Zero),
  .L(LessThan),
  .F(AddFlag),
  .Rslt(Rslt),
  .Zero(Z),
  .LessThan(L),
  .SCo(SCo),
  .AddFlag(F)
  );

// assign WdatD = RdatA;
// assign Addr = Rslt;
DMem dm(
  .Clk,
  .Wen (WenD),
  .WDat(RdatA),
  .Addr(Rslt),
  .Rdat(Rdat)
  );

MemToRegMUX MRM1(
  .Rslt(Rslt),
  .Rdat(Rdat),
  .MemToReg(MemToReg),
  .WriteBackData(WdatR)
);


endmodule
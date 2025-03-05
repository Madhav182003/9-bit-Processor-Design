module Ctrl(
  input        [8:0] mach_code,
  input logic Zero, LessThan, AddFlag,
  output logic [3:0] Aluop,
  output logic [2:0] Ra,
			         Rb,
					 Wd,
  output logic       WenR,
					 WenD,
					 Branch, //Goes straight to PC
					 MemToReg, D1sel, D2sel,
  output logic [7:0] Immediate
);

  logic[7:0] MemOff, ShiftAmt, MovImm;

//can place reg addrss file multiplexor here as well.
//separate outputs for all flags

//ALU data multiplexors must be in the TopLevel as a separte unit
//Also WriteBack Multiplexor in TopLevel

//1010 01 000
//8765 43 210

  always_comb begin
	Aluop = mach_code[8:5];		// ALU

	Ra	  = mach_code[4:3];//{1'b0,mach_code[4:3]};		// reg file addr A
	Rb    = mach_code[2:0];		        // reg file addr B
	Wd    = Ra;     // reg file write addr

	WenR  = 0;		// reg file write enable
	WenD  = 0;		// data mem write enable
	
	MemToReg = 0;   // MUXs sel values
	D1sel = 0;
	D2sel = 0;

	Branch = 0;
	//Jump = {{7{mach_code[4]}},mach_code[4:0]}; SignExtended Jump value

	MemOff={3'b000, mach_code[4:0]};
	ShiftAmt = {6'b000000, mach_code[1:0]};
	MovImm = {5'b000, mach_code[2:0]};

	Immediate = 8'b00000000;

case (Aluop)
	0: // branch if equal
		begin Branch = Zero;/*Zero*/ 
		end

	1: // Add
		begin WenR = 1; 
		end

	2: // Not
		begin WenR = 1; 
		end

	3: // XOR
		begin WenR = 1; 
		end

	4: begin// LSL
		WenR = 1;
		Ra = mach_code[4:2];
		Wd = Ra;
		Immediate = ShiftAmt;
		D2sel = 1; end
		//Make ALU Data2 value select ShiftAmt

	5: begin // LSR
		WenR = 1;
		Ra = mach_code[4:2];
		Wd = Ra;
		Immediate = ShiftAmt;
		D2sel = 1; end
		//Make ALU Data2 value select ShiftAmt

	6: begin// Move
		WenR = 1;
		Wd = Rb; end
		//Here, ALU doesn't need to do a thing
		//Can Make Add 0 to Ra   OR  Routing using MUX for Dat Into Register 
		// Can just do Rslt = DataA

	7: begin end// Compare
		//This only Writes to FlagReg

	8: begin end// Signed Compare
		//This only Writes to FlagReg

	9: // Branch Less Than
		begin Branch = LessThan; end

	10: begin // Move Immediate --- go with make ALU add zero approach, Rslt = DataB(Imm)
		WenR = 1;
		Immediate = MovImm;
		D2sel = 1; end

	11: // Add with Carry
		begin WenR = 1; end

	12: // Reduction Add
		begin WenR = 1; end

	13: begin WenR = AddFlag; end// Adf

	14: begin // Store
		WenD = 1;
		Ra = 3'b000;
		Rb = 3'b001;
		Immediate = MemOff;
		D1sel = 1;
		D2sel = 1; end

	15: begin // Load
		WenR = 1;
		MemToReg = 1;
		Ra = 3'b000;
		Rb = 3'b001;
		Wd = Ra;
		Immediate = MemOff;
		D1sel = 1;
		D2sel = 1; end
	
endcase
end

endmodule
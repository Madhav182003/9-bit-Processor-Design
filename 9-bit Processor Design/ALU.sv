module ALU(
  input [3:0] Aluop,
  input [7:0] DatA,
              DatB,
  input logic CarryIn, Z, L, F,
  output logic[7:0] Rslt,
  output logic      Zero,
                    LessThan,
			        SCo,
					AddFlag);

always_comb begin

	Rslt = 8'b00000001;
	// Zero = 0;
	// LessThan = 0;
	SCo = CarryIn; //Carry flag carried over operations that don't affect it
    LessThan = L;
	Zero = Z;
	AddFlag = F;
	
	case (Aluop)
    0, 9: begin end // branch if equal, branch lessthan
		//no ALU operations in this case
	1: // Add
		begin	{SCo,Rslt} = DatA + DatB; end

	2: // Not
		begin Rslt = ~DatB; end

	3: // XOR
		begin Rslt = DatA^DatB; end

	4: // LSL
		begin {SCo, Rslt} = DatA << DatB;
				Rslt = Rslt+CarryIn; end

	5: // LSR
		//begin Rslt = DatA >> DatB; end
    begin AddFlag = DatA[0];
			Rslt = DatA>>DatB; end

	6: // Move
		begin Rslt = DatA; end

	7: // Compare --- may use 9th bit internally and detect that way //00000000 - 11111111
	begin {LessThan,Rslt} = DatA - DatB;
			Zero = !(LessThan|Rslt[7]|Rslt[6]|Rslt[5]|Rslt[4]|Rslt[3]|Rslt[2]|Rslt[1]|Rslt[0]);
			/*LessThan = Rslt[7];*/ end
		//This only Writes to FlagReg

	8: // Signed Compare
	begin 
		if(DatA[7] == 1 && DatB[7]==0)
		begin 	LessThan=1;
				Zero = 0; end
		else if(DatA[7] ==0 && DatB[7]==1)
		begin	LessThan = 0;
				Zero = 0; end
		else
		begin	Rslt = DatA-DatB;
				Zero = !(LessThan|Rslt[7]|Rslt[6]|Rslt[5]|Rslt[4]|Rslt[3]|Rslt[2]|Rslt[1]|Rslt[0]);
				LessThan = Rslt[7]; end
	end
			//This only Writes to FlagReg

	10: // Move Immediate --- go with make ALU add zero approach, Rslt = DataB(Imm)
		begin Rslt = DatB; end

	11: // Add with Carry
		begin {SCo, Rslt} = DatA + DatB + CarryIn; end

	12: // Reduction Add
		begin Rslt = DatB[7] + DatB[6] + DatB[5] + DatB[4] + DatB[3] + DatB[2] + DatB[1] + DatB[0] ;
		end
	13: // Adf
	begin if(F) {SCo, Rslt} = DatA+DatB+CarryIn;
			else Rslt = DatA; end

	14, 15: // Store, Load
		begin Rslt = DatA + DatB; end
      
    endcase

	// Zero = !(Rslt[7]|Rslt[6]|Rslt[5]|Rslt[4]|Rslt[3]|Rslt[2]|Rslt[1]|Rslt[0]);
  	// LessThan  = Rslt[7];


  // Rslt = 8'b0;
  // SCo  = 8'b0;
  // case(Aluop)
  //   2'b00: {SCo,Rslt} = DatA + DatB;   // add
  //   2'b01: {SCo,Rslt} = DatA<<1'b1;    // left shift
	// 2'b10: Rslt       = DatA & DatB;   // bitwise AND
	// 2'b11: Rslt       = DatA ^ DatB;   // bitwise XOR
  // endcase


end

//   assign Zero = !(Rslt[7]|Rslt[6]|Rslt[5]|Rslt[4]|Rslt[3]|Rslt[2]|Rslt[1]|Rslt[0]);
//   assign LessThan  = Rslt[7];

endmodule
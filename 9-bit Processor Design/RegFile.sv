module RegFile(
  input      Clk, Reset,	 // clock
             Wen,    // write enable
  input[2:0] Ra,     // read address pointer A
  input[2:0] Rb,     //                      B
	input[2:0] Wd,	 // write address pointer
  input[7:0] Wdat,   // write data in
  output[7:0]RdatA,	 // read data out A
             RdatB   // read data out B
            ); 

  logic[7:0] Core[8]; // reg file itself (4*8 array)

  always_ff @(posedge Clk) begin
    if(Reset)begin
      Core[0]<=8'b00000000;
      Core[1]<=8'b00000000;
      Core[2]<=8'b00000000;
      Core[3]<=8'b00000000;
      Core[4]<=8'b00000000;
      Core[5]<=8'b00000000;
      Core[6]<=8'b00000000;
      Core[7]<=8'b00000000;
    end
    if(Wen) Core[Wd] <= Wdat;
  end
  assign RdatA = Core[Ra];
  assign RdatB = Core[Rb];

endmodule
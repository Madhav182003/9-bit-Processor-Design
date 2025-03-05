module FlagsReg(
    input Clk, Reset,
    input logic C, L, Z, F,
    output logic Carry, LessThan, Zero, AddFlag
);
    logic Core[4];

    always_ff @(posedge Clk ) begin //should this be negedge?
        if(Reset) begin
            Core[0]<=0;
            Core[1]<=0;
            Core[2]<=0;
            Core[3]<=0;
        end //checking for x's is not synthesizable
        else begin 
            Core[0]<=Z;
            Core[1]<=L;
            Core[2]<=C;
            Core[3]<=F;
        end
    end

    //Writes Sequential, Read Combinational

    assign Zero = Core[0];
    assign LessThan = Core[1];
    assign Carry = Core[2];
    assign AddFlag = Core[3];

endmodule
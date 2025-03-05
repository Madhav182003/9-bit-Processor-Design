module ALUD2MUX(
    input logic D2sel,
    input logic[7:0] RdatB, Immediate,
    output logic [7:0] ALUD2
);
    
    always_comb begin
        if(D2sel==0) ALUD2=RdatB;
        else ALUD2 = Immediate;
    end

endmodule
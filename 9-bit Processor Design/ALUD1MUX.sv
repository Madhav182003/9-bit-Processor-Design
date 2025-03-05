module ALUD1MUX(
    input logic D1sel,
    input logic[7:0] RdatA, RdatB,
    output logic [7:0] ALUD1
);
    
    always_comb begin
        if(D1sel==0) ALUD1=RdatA;
        else ALUD1 = RdatB;
    end

endmodule
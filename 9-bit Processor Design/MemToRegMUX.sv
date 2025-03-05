module MemToRegMUX(
    input logic [7:0] Rslt,
                      Rdat,
    input logic MemToReg,
    output logic [7:0] WriteBackData
);
    
    always_comb begin
        if(MemToReg==0)
            WriteBackData = Rslt;
        else 
            WriteBackData = Rdat;
    end

endmodule
module JLUT(
    input Clk, Reset,
    input [4:0] addr,
    output [11:0] Jump
);
    logic [11:0] Core[32];

    always_ff @(posedge Clk ) begin //should this be negedge?
        if(Reset) begin
            Core[0]<=12'b000000000000; //0
            
            Core[1]<=12'b000000101111; //47
            Core[2]<=12'b000001001011; //75
            Core[3]<=12'b000001001101; //77
            Core[4]<=12'b000001010010; //82
            Core[5]<=12'b000001010100; //84
            Core[6]<=12'b000001011110; //94
            Core[7]<=12'b000000101100; //44 --End of Prog1 Addresses

            Core[8]<=12'b000000000000; // 0 - not used

            Core[9]<=12'b000000100000; //32
            Core[10]<=12'b000000010101; //21
            Core[11]<=12'b000001000110; //70
            Core[12]<=12'b000000111011; //59
            Core[13]<=12'b000001100111; //103
            Core[14]<=12'b000000000011; //3 --End of Prog 3 addresses

            Core[15]<=12'b000000100101;//37
            Core[16]<=12'b000000101000;//40
            Core[17]<=12'b000000110011;//51
            Core[18]<=12'b000001000001;//65
            Core[19]<=12'b000001001111;//79
            Core[20]<=12'b000001011100;//92
            Core[21]<=12'b000001100000;//96
            Core[22]<=12'b000001101010;//106
            Core[23]<=12'b000001111000;//118 -> 120
            Core[24]<=12'b000001111100;//122 -> 124
            Core[25]<=12'b000010000011;//129 -> 131
            Core[26]<=12'b000010001110;//140 -> 142
            Core[27]<=12'b000010010100;//146 -> 148
            Core[28]<=12'b000010011010;//152 -> 154
            Core[29]<=12'b000010100100;//162 -> 164
            //--End of Program 2 addresses

            Core[30]<=12'b000000000000;// 0 - not used
            Core[31]<=12'b000000000000;// 0 - not used

        end
        
    end

    //Writes Sequential, Read Combinational

    assign Jump = Core[addr];

endmodule
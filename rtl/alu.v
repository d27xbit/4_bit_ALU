module alu(
    input [3:0]A,
    input [3:0]B,
    input [2:0]S,
    output reg [3:0]Y
    );
    always@(*) 
    begin
    case(S)
        3'b000: Y = A + B;
        3'b001: Y = A - B;
        3'b010: Y = A & B;
        3'b011: Y = A | B;
        3'b100: Y = A ^ B; //xor
        3'b101: Y = A << 1; //left shirt by 1 bit
        3'b110: Y = A >> 1; //right shift by 1 bit
        3'b110: Y = ~A;          
        default: Y = 4'b0000;
    endcase 
    end      
endmodule

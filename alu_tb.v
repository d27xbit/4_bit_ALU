`timescale 1ns/1ps

module alu_tb;

reg [3:0] A, B; 
reg [2:0] S; wire [3:0] Y;

alu uut(
    .A(A),.B(B),.S(S),.Y(Y)
    );
    
initial
begin
    A = 4'h3; B = 4'hA; S = 3'b000;
    
    #5 S= 3'd1;
    #5 S = 3'b010; #5 S = 3'b011; #5 S = 3'b100;
    #5 A = 4'h9; S = 3'b101; #5 B = 4'h7; S = 3'b101; #5 S= 3'b110;
    #5 S = 3'b111; #5 S=3'b000 S = 3'b1x1;
    #10 $finish;
    end
endmodule

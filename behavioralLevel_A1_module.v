`timescale 1ns / 1ps

module A1(
    input [2:0] i; // we put i as input and since the numbers in the truth tabel represented in 3 digits from 0 to 2 and the truth tabel has 7 levels starting from 0 and ending at 7. 
    output reg f // be careful to write reg at the output before defining the name of the output variable.
);

always @(i) // inside the brackets put the input variable.
begin // represent the brackets
    case (i) // case to represent the truth tabel raws and insidethe brackets is the input variable i.
        3'b000: f=1; // 3'b that mean it will write a number with 3 bits.
        3'b001: f=0;
        3'b010: f=0;
        3'b011: f=0;
        3'b100: f=1;
        3'b101: f=0;
        3'b110: f=1;
        3'b111: f=1;
    endcase
end
endmodule
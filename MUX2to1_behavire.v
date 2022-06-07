`timescale 1ns / 1ps

module mux2to1(
input Io,
input I1,
input select
output reg y
    );

always @(*) // all variables are needed
begin
    if (select ==0)
        y= Io;
    else if (select==1)
        y = I1; 
end

endmodule
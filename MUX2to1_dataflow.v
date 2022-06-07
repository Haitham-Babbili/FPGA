`timescale 1ns / 1ps

module mux2to1(
input Io,
input I1,
input select
output y
    );

assign y = (~select && Io) || (select && I1); // //assign y = select ? I1 : I0; // like if statment in c++

endmodule
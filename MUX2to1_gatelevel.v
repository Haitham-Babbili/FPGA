`timescale 1ns / 1ps

module mux2to1(
input Io,
input I1,
input select
output y
    );

wire w1;
wire w2;

and g1(w1,~select,Io);
and g2(w2,select,I1);
or g3(y,g1,g2);

endmodule
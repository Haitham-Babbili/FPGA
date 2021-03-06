`timescale 1ns / 1ps
module A2(
    input a,b,c,
    output f
);

wire w1;
wire w2;

and g1(w1,a,b);
and g2(w2,~b,~c);
or g3(f,w1,w2);
endmodule
`timescale 1ns / 1ps

module A1(
    input a,b,c,
    output f
);

assign f = (~b&&~c) || (a&&b);

endmodule
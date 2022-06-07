`timescale 1ns / 1ps

module D_flip_flop(
    input D,
    input clk,
    output reg Q
);

always @(posedge clk) // posdge: mean positive edge of the clock or hte rised edge whilenegedge: mean negative edge of the clock or the go down edge
begin
    Q<=D;  // <= means non-Bloking
end
endmodule
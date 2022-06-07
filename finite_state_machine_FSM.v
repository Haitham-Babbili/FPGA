module FSM001 #(parameter stateA = 2'b00,
                          stateB = 2'b01, 
                          stateC = 2'b10, 
                          stateD = 2'b11)
(
    input wire clk,
    input wire in,
    output wire out
);

// define the current and the next state where both start at zero,then apply the next stat by using 3 always statments.
/*reg[1:0] currentstate=2'b00;
reg[1:0] nextstate=2'b00;
*/
reg[1:0] currentstate, nextstate=2'b00;

//next state
always @(in or currentstate)
begin
    case(currentstate) // the current state will change depending on the net stage, think about it like you current state now is the next state from priviuos stage, i.e, past nexte stage 
        stateA: if(in==0)
                    nextstate = stateB;
                else
                    nextstate = stateA;
        stateB: if(in==1)
                    nextstate = stateC;
                else
                    nextstate = stateB;
        stateC: if(in==1)
                    nextstate = stateD;
                else
                    nextstate = stateC;
        stateD: if(in==0)
                    nextstate = stateB;
                else
                    nextstate = stateA;
        default: nextstate = stateA;             
    endcase
end

//current state
always @(posedge clk)
begin
    currentstate = nextstate;
end

//output
assign out= (currentstate==stateD) ? 1:0;

endmodule


 

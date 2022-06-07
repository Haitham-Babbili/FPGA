
module FSM_angle #(parameter state0 = 2'b00, stare90 = 2'b01, state180 = 2'b10, state270 = 2'b11)
(
    input clk,rst,cw,ccw,
    input wire[1:0] physicalPosition,
    output wire[1:0] desiredPosition
);

reg[1:0] currentstate, nextstate = 2'b00; 

// next state
always @(cw or ccw or physicalPosition or currentstate)
begin
    case(currentstate)
        state0 : if(cw==1)
                    nextstate = state90;
                 else if(ccw==1)
                    nextstate = state270;
                 else
                    nextstate = state0;
        state90 : if(cw==1)
                    nextstate = state180;
                  else if(ccw==1)
                    nextstate = state0;
                  else
                    nextstate = stare90;
        state180 : if(cw==1)
                     nextstate = state270;
                   else if(ccw==1)
                     nextstate = state90;
                   else
                     nextstate = state180;
        state270 : if(cw==1)
                     nextstate = state0;
                   else if(ccw==1)
                     nextstate = state180;
                   else
                     nextstate = state270;
        default : nextstate = state0;

    endcase
end


// current state
always @(posedge clk)
begin
    if (rst)
    currentstate = physicalPosition;
    else
    currentstate = nextstate;
end

// output
assign desiredPosition = currentstate

endmodule
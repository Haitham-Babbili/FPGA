module stopwatch(
    input clock, reset,start,
    input in0, in1, in2, in3, // 4-bits to 8-digits 0000 = 0, 0001 = 1, 0010 = 2, 0011 = 3,...,1111 = 7
    output a,b,c,d,e,f,g, db
    output [3:0] an //enable
);

reg[3:0] reg_d0 = 0; //digit for 0.1 seconds
reg[3:0] reg_d1 = 0; //digit for seconds
reg[3:0] reg_d2 = 0; //digit for next seconds
reg[3:0] reg_d3 = 0; //digit for minutes
reg[22:0] ticker = 0; //digit for counter
reg click = 0; //

always @(posedge clock)
begin
    if(reset)
        ticker <=0;
    else if(start)
        ticker <= ticker +1;
        click <= ((ticker == 5000000));
end

always @ (posedge clock)
begin
    if(reset)
        begin
            reg_d0 <= 0;
            reg_d1 <= 0;
            reg_d2 <= 0;
            reg_d3 <= 0;
        end
    else if(click)
        begin
            if (reg_d0 == 9) // reach to the last bit so reset
                begin
                    reg_d0 <=0;
                    if (reg_d1 == 9)
                        begin
                            reg_d1 <=0;
                        if (reg_d2 == 5) //minutes have 59
                            begin
                                reg_d2 <= 0;
                                if (reg_d3 == 9) // This is last if its hard to reach
                                    reg_d3 <= 0;
                                else 
                                    reg_d3 <= reg_d3+1;
                            end
                        else
                            reg_d2 <= reg_d2+1;
                        end
                    else
                        reg_d1 <= reg_d1+1;
                end
            else
                reg_d0 = reg_d1 +1;
        end
end

// show the results  
localparam N = 2; // for count

reg[N-1:0] count = 0; 

// start cout or reset
always @ (posedge clock or posedge reset)
begin
    if(reset)
        count <= 0;
    else
        count <= count +1;
end

reg[6:0] sseg = 0; // seven segment register to not chage or distroy the output a,b,c,....
reg[6:0] sseg_temp = 0;
reg[3:0] an_temp = 0;
reg reg_dp = 0;

always @ (posedge clock)
begin
    case(count[N-1:N-2])
        2'b00:
            begin
                sseg = reg_d0;
                an_temp = 4'b1110;
                reg_dp = 1'b1;
            end
        2'b01:
            begin
                sseg = reg_d1;
                an_temp = 4'b1101;
                reg_dp = 1'b0;
            end
        2'b10:
            begin
                ssg = reg_d2;
                an_temp = 4'b1011;
                reg_db = 1'b1;
            end
        2'b11:
            begin
                ssg = reg_d3;
                an_temp = 4'b0111;
                reg_dp = 1'b0;
                count = 0;
            end
    endcase
end
assign an = an_temp;


// convert to seven segment digit
always @ (posedge clock)
begin
    case(sseg)
        4'd0 : sseg_temp = 7'b1000000;
        4'd1 : sseg_temp = 7'b1111001;
        4'd2 : sseg_temp = 7'b0100100;
        4'd3 : sseg_temp = 7'b0110000;
        4'd4 : sseg_temp = 7'b0011001;
        4'd5 : sseg_temp = 7'b0010010;
        4'd6 : sseg_temp = 7'b0000010;
        4'd7 : sseg_temp = 7'b1111000;
        4'd8 : sseg_temp = 7'b0000000;
        4'd9 : sseg_temp = 7'b0010000;
        default : sseg_temp = 7'b0111111;
    endcase
end

assign {g,f,e,d,c,b,a} = sseg_temp;

assign_db = reg_dp;

endmodule


module traffic_light
(
    input clk,rst,
    output reg[2:0] a,b // a for first traffic light, b for the second traffic light
);

localparam S0 = 6'b000001,
        S1 = 6'b000010,
        S2 = 6'b000100,
        S3 = 6'b001000,
        S4 = 6'b010000,
        S5 = 6'b100000;

localparam SEC5 = 4'd5, SCE1 =4'd1;

reg[3:0] count =1;
reg[5:0] state;

always @(posedge clk or posedge rst)
begin
if(rst ==1)
    begin
        state <= S0;
        count <= 1;
    end
else
    case(state)
        S0: if(count <= SEC5)
                begin
                    state <= S0;
                    count <= count+1;
                end
            else 
                begin
                    state <=S1;
                    count <= 1;
                end
        S1: if(coubt < SCE1)
                begin
                    state <= S1;
                    count <= count+1;
                end
            else
                begin
                    state <= S2;
                    count <= 1;
                end
        S2: if(coubt < SCE1)
                begin
                    state <= S2;
                    count <= count+1;
                end
            else
                begin
                    state <= S3;
                    count <= 1;
                end
        S3: if(count <= SEC5)
                begin
                    state <= S3;
                    count <= count+1;
                end
            else 
                begin
                    state <=S4;
                    count <= 1;
                end

        S4: if(coubt < SCE1)
                begin
                    state <= S4;
                    count <= count+1;
                end
            else
                begin
                    state <= S5;
                    count <= 1;
                end
        S2: if(coubt < SCE1)
                begin
                    state <= S5;
                    count <= count+1;
                end
            else
                begin
                    state <= S0;
                    count <= 1;
                end
        default state = S0;
    endcase
end

// output
always @(*) //always runing 
begin
    case (state)
        S0: begin a <= 3'b001; b <= 3'b100; end  // 3'b001 read light, 3'b100 green light
        S1: begin a <= 3'b010; b <= 3'b100; end
        S2: begin a <= 3'b100; b <= 3'b100; end
        S3: begin a <= 3'b100; b <= 3'b001; end
        S4: begin a <= 3'b100; b <= 3'b010; end
        S5: begin a <= 3'b100; b <= 3'b100; end
        default begin a <= 3'b100; b <= 3'b100; end
    endcase
end

endmodule
 
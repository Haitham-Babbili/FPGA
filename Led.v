`timescale 1ns / 1ps

module LED_Blink
/*
(
    input [3:0]cun,
    input [1:0]i_switch,
    input i_enable,
    output o_mixer,
    output reg o_led_driver
);

always @(cun or i_switch)
begin
    case(i_switch)
        2'b00: o_mixer <= cun[0];
        2'b01: o_mixer <= cun[1];
        2'b10: o_mixer <= cun[2];
        2'b11: o_mixer <= cun[3];
    endcase
end

always @(i_enable or o_mixer or)
    begin
        assign o_led_driver = (i_enable && o_mixer);
    end
*/
(
    input i_clock,
    input i-enable,
    input i_switch_1,
    input i_switch_2,
    output reg o_led_drive
);

/*
Parameter should be created for LED Drive depending on the mane clock frequency provided (24 MHz):
so the parameter is for 1, 10, 50, 100 Hz but HDL clock should work at 
the halve time of main clock frequency so the parameter will follow: 
parm = (25 MHz/ 1, 10, 50, 100 Hz)* 0,5
*/
parameter i_counter_1Hz   = 12500000;
parameter i_counter_10Hz  = 1250000;
parameter i_counter_50Hz  = 250000;
parameter i_counter_100Hz = 125000;
 

// creat counter signal for the clock parameter
reg [31:0] r_ctr_1Hz= 0;
reg [31:0] r_ctr_10Hz= 0;
reg [31:0] r_ctr_50Hz= 0;
reg [31:0] r_ctr_100Hz= 0;

// Toggel the signal at needed frequency
reg  r_Toggle_1Hz = 1'b0;
reg  r_Toggle_10Hz = 1'b0;
reg  r_Toggle_50Hz = 1'b0;
reg  r_Toggle_100Hz = 1'b0;


reg r_L_Led;
begin
    /*
    Now we create a process where the register is start from zero and increase untill reach to its counter parameter, i.e. i_counter_1Hz), 
    when the register is the counter value, the Toggel will change to one and the lLED will turn to one,
    then register will be set to zero again and the statr icrease to counter value. 
    */
    always @(i_clock) // 1Hz counter
    begin
        if(r_ctr_1Hz == i_counter_1Hz-1) // -1, since counter starts at 0, when register is the counter value
            begin
                r_Toggle_1Hz <= ! r_Toggle_1Hz // change Toggel value from the priviuse value (1 or 0)
                r_ctr_1Hz <= 0; // set it back to zero to start count again
            end
        else // if not equale
        r_ctr_1Hz <= r_ctr_1Hz+1; // increase register value
    end

    always @(i_clock) // 10Hz counter
    begin
        if(r_ctr_10Hz == i_counter_10Hz-1) // -1, since counter starts at 0, when register is the counter value
            begin
                r_Toggle_10Hz <= ! r_Toggle_10Hz // change Toggel value from the priviuse value (1 or 0)
                r_ctr_10Hz <= 0; // set it back to zero to start count again
            end
        else // if not equale
        r_ctr_10Hz <= r_ctr_10Hz+1; // increase register value
    end

    always @(i_clock) // 50Hz counter
    begin
        if(r_ctr_50Hz == i_counter_50Hz-1) // -1, since counter starts at 0, when register is the counter value
            begin
                r_Toggle_50Hz <= ! r_Toggle_50Hz // change Toggel value from the priviuse value (1 or 0)
                r_ctr_50Hz <= 0; // set it back to zero to start count again
            end
        else // if not equale
        r_ctr_50Hz <= r_ctr_50Hz+1; // increase register value
    end

    always @(i_clock)
    begin
        if(r_ctr_100Hz == i_counter_100Hz-1) // -1, since counter starts at 0, when register is the counter value
            begin
                r_Toggle_100Hz <= ! r_Toggle_100Hz // change Toggel value from the priviuse value (1 or 0)
                r_ctr_100Hz <= 0; // set it back to zero to start count again
            end
        else // if not equale
        r_ctr_100Hz <= r_ctr_100Hz+1; // increase register value
    end

    /*
    Create the Switch case to chouse which counter will be the output of the mixer 
    */
    always @(*)
    begin
        case({i_switch_1,i_switch_2}) // i_switch is concanitated to make the 00,01,10,11 then equal to r_toggle_Hz
        2'b00: r_L_Led = r_Toggle_100Hz;
        2'b01: r_L_Led = r_Toggle_50Hz;
        2'b10: r_L_Led = r_Toggle_10Hz;
        2'b11: r_L_Led = r_Toggle_1Hz;
        endcase
    end

    assign o_led_driver = r_L_Led && i_enable;

end 

endmodule
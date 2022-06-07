//verilog example of the shift register for delay

reg[3:0] r_shift;

always @ (posedge i_clock)
  begin
      r_shift[3:1] <= r_shift[2:0];
      r_shift[0] <= i_Data_to_Delay;
  end

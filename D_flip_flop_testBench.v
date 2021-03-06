`timescale 1ns / 1ps


module flip_flop_test;

	// Inputs
	reg D;
	reg clk;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	d_flip_flop uut (
		.D(D), 
		.clk(clk), 
		.Q(Q)
	);
	
	always
	#10 clk = ~clk; // Here the clock has been added and initialized at 10 ns.

	initial begin
		// Initialize Inputs
		D = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#50; // delay 50 ns
		D = 1;
		
		#50;
		D = 0;
		
		#50;
		D = 1;
		
		#50;
		D = 0;
		
		#50 $finish;
        
		// Add stimulus here

	end
      
endmodule

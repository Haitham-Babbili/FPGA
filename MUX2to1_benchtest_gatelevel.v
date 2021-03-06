`timescale 1ns / 1ps

module non_test;

	// Inputs
	reg a;
	reg clk;

	// Outputs
	wire c;

	// Instantiate the Unit Under Test (UUT)
	non uut (
		.a(a), 
		.clk(clk), 
		.c(c)
	);
	
	always
	#10 clk = ~clk;

	initial begin
		// Initialize Inputs
		a = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 1;
		
		#100;
		a = 0;
		
		#100;
		a = 1;
		
		#100;
		a = 0;
		
		#100 $finish;
        
		// Add stimulus here

	end
      
endmodule
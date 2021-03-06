`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module A1Test;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire f;

	// Instantiate the Unit Under Test (UUT)
	A1 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.f(f)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;

		// Wait 100 ns for global reset to finish
		#10;
		a=0; b=0; c=0;
		
		#10;
		a=0; b=0; c=1;
		
		#10;
		a=0; b=1; c=0;
		
		#10;
		a=0; b=1; c=1;
		
		#10;
		a=1; b=0; c=0;
		
		#10;
		a=1; b=0; c=1;
		
		#10;
		a=1; b=1; c=0;
		
		#10;
		a=1; b=1; c=1;
		
		#10 $finish;
        
		// Add stimulus here

	end
      
endmodule

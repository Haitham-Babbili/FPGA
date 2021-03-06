`timescale 1ns / 1ps



module A1Test;

	// Inputs
	reg [2:0] i;

	// Outputs
	wire f;

	// Instantiate the Unit Under Test (UUT)
	A1 uut (
		.i(i), 
		.f(f)
	);

	initial begin
		// Initialize Inputs
		i = 0;

		// Wait 100 ns for global reset to finish
		#10;
		i = 3'b000;
		
		#10;
		i = 3'b001;
		
		#10;
		i = 3'b010;
		
		#10;
		i = 3'b011;
		
		#10;
		i = 3'b100;
		
		#10;
		i = 3'b101;
		
		#10;
		i = 3'b110;
		
		#10;
		i = 3'b111;

		#10 $finish;
        
		// Add stimulus here

	end
      
endmodule
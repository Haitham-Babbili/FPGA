// And Gate Example in Verilog
module and_Gate_example(in1,in2,and_result);
input in1;
input in2:
output and_result;

wire and_template;

assign and_template = in1 & in2;

assign and_result = and_template;

endmodule
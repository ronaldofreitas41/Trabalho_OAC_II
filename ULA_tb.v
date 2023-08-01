`include "ULA.v"

module tb;
	
	reg         clk;
	reg  [0:3]  inputULA;
	reg  [0:31] a;
	reg  [0:31] b;
	wire [0:31] outputULA;
	
	initial begin
		
		$monitor("clk=%b, inputULA=%b, a=%b, b=%b, outputULA=%b", clk, inputULA, a, b, outputULA);
		$dumpfile("ULA.vcd");
		$dumpvars(0, tb);
		
		clk = 0;
		
		inputULA = 4'b0010; //add
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000011;
		
		#2
		
		inputULA = 4'b0110; //sub
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000001;
		
		#2
		
		inputULA = 4'b0000; //and
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000001;
		
		#2
		
		inputULA = 4'b0001; //or
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000001;
		
		#2
		
		inputULA = 4'b0111; //slt
		a = 32'b00000000000000000000000000000001;
		b = 32'b00000000000000000000000000000011;
		
		
		#2 $finish;
	end
	
	always begin
		#1 clk = !clk;
	end
	
	ULA ULA_tb(
		.clk(clk),
		.inputULA(inputULA),
		.a(a),
		.b(b),
		.outputULA(outputULA)
	);
endmodule
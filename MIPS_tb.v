`include "MIPS.v"

module tb;
	
	reg         clk;
	reg  [0:1]  OpALU;
	reg  [0:5]  funct;
	reg  [0:31] a;
	reg  [0:31] b;
	wire [0:31] outputULA;
	
	initial begin
		
		$monitor("clk=%b, OpALU=%b, funct=%b, a=%b, b=%b, outputULA=%b", clk, OpALU, funct, a, b, outputULA);
		$dumpfile("MIPS.vcd");
		$dumpvars(0, tb);
		
		clk = 0;
		
		
		//LW ou SW resultado 000...110
		OpALU = 2'b00;
		funct = 6'b000000;
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000011;
		
		#2
		
		//ADD resultado 000...100
		OpALU = 2'b10;
		funct = 6'b100000;
		a = 32'b00000000000000000000000000000001;
		b = 32'b00000000000000000000000000000011;
		
		#2
		
		//SUB resultado 000...010
		OpALU = 2'b10;
		funct = 6'b100010;
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000001;
		
		#2
		
		//AND resultado 000...001
		OpALU = 2'b10;
		funct = 6'b100100;
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000001;
		
		#2
		
		//OR resultado 000.011
		OpALU = 2'b10;
		funct = 6'b100101;
		a = 32'b00000000000000000000000000000011;
		b = 32'b00000000000000000000000000000001;
		
		#2
		
		//SLT resultado 000...001
		OpALU = 2'b10;
		funct = 6'b101010;
		a = 32'b00000000000000000000000000000001;
		b = 32'b00000000000000000000000000000011;
		
		
		#2 $finish;
	end
	
	always begin
		#1 clk = !clk;
	end
	
	MIPS MIPS_tb(
		.clk(clk),
		.OpALU(OpALU),
		.funct(funct),
		.a(a),
		.b(b),
		.outputULA(outputULA)
	);
endmodule
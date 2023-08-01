`include "ULAControl.v"

module tb;
	
	reg        clk;
	reg [0:1]  OpALU;
	reg [0:5]  funct;
	wire [0:3] inputALU;
	
	initial begin
		
		$monitor("clk=%b, OpALU=%b, funct=%b, inputALU=%b", clk, OpALU, funct, inputALU);
		$dumpfile("ULAControl.vcd");
		$dumpvars(0, tb);
		
		clk = 0;
		
		OpALU = 2'b00;
		funct = 6'b000000;
		#2
		OpALU = 2'b01;
		funct = 6'b000000;
		#2
		OpALU = 2'b10;
		funct = 6'b100000;
		#2
		OpALU = 2'b10;
		funct = 6'b100010;
		#2
		OpALU = 2'b10;
		funct = 6'b100100;
		#2
		OpALU = 2'b10;
		funct = 6'b100101;
		#2
		OpALU = 2'b10;
		funct = 6'b101010;
		
		#2 $finish;
	end
	
	always begin
		#1 clk = !clk;
	end
	
	ULAControl ULAControl_tb(
		.clk(clk),
		.OpALU(OpALU),
		.funct(funct),
		.inputALU(inputALU)
	);
endmodule
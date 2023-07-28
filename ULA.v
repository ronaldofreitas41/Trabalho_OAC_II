module ULA (input         clk,
			input  [0:3]  inputULA, 
			input  [0:31] a,
			input  [0:31] b,
			output reg [0:31] outputULA);
	always @(posedge clk) begin
	   	case (inputULA):
			4'b0010: //Operação "Add"
				outputULA <= a + b;
			4'b0110: //Operação "Sub"
				outputULA <= a - b;
			4'b0000: //Operação "And"
				outputULA <= a & b;
			4'b0001: //Operação "Or"
				outputULA <= a || b;
			4'b0111; //Operação "Slt"
				    if (a < b)
        				outputULA = 1;
    				else
        				outputULA = 0;
			default://Se a entrada não bater com nada nenhuma operação será realizada
		endcase
	end
endmodule
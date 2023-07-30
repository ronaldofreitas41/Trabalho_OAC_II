module ULAControl(input            clk,
			      input      [0:1] OpALU,
				  input      [0:5] funct,
				  output reg [0:3] inputALU);
		
			case (OpALU):
				2'b00://Não sei 
					outputULA <= a + b;
				2'b01://Beq
					outputULA <= a - b;
				2'b10://Tipo R
					case (funct):
						6'b100000: //Operação "Add"
							outputULA <= a + b;
						6'b100010: //Operação "Sub"
							outputULA <= a - b;
						6'b100100: //Operação "And"
							outputULA <= a & b;
						6'b100101: //Operação "Or"
							outputULA <= a || b;
						6'b101010; //Operação "Slt"
								if (a < b)
									outputULA = 1;
								else
									outputULA = 0;
						default://Se a entrada não bater com nada nenhuma operação será realizada
					endcase  
			default://Se a entrada não bater com nada nenhuma operação será realizada
			endcase 
	
endmodule
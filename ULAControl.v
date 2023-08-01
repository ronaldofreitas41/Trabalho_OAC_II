module ULAControl(input            clk,
			      input      [0:1] OpALU,
				  input      [0:5] funct,
				  output reg [0:3] inputALU);
		always @(clk) begin
			case(OpALU)
				2'b00://Lw ou SW
					inputALU <= 4'b0010;
				2'b01://Beq
					inputALU <= 4'b0110;
				2'b10://Tipo R
					begin
						case(funct)
							6'b100000: //Operação "Add"
								inputALU <= 4'b0010;
							6'b100010: //Operação "Sub"
								inputALU <= 4'b0110;
							6'b100100: //Operação "And"
								inputALU <= 4'b0000;
							6'b100101: //Operação "Or"
								inputALU <= 4'b0001;
							6'b101010: //Operação "Slt"
								inputALU <= 4'b0111;
							default://Se a entrada não bater com nada nenhuma operação será realizada
								inputALU <= 4'bxxxx;
						endcase
					end
				default:
					inputALU <= 4'bxxxx;
			endcase 
		end
endmodule
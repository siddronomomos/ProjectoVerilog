//1. Declaracion modulos de salida
module Unida_control (
    input wire [5:0] inst,
    output reg  MemToRg,
    output reg  MemToWrite,
    output reg  RegWrite,
    output reg [2:0]ALUOP
);
//2. Definir elementos internos del modulo 
//3. Declarar los procesos secuenciales, asignaciones y/o instancias
always@(*)
	begin
	  case(inst)
	   6'd0:
		begin
			  MemToRg = 1'b0;
			  MemToWrite = 1'b1;
			  RegWrite =1'b0;
		end

	  default: ALUOP = 3'b0;
	endcase
end
endmodule

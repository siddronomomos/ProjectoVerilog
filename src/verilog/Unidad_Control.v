//1. Declaracion modulos de salida
module Unida_control (
    input wire [5:0] inst,
	output reg  RegDst,
	output reg  Branch,
	output reg  MemRead,
    output reg  MemToRg,
	output reg [2:0]ALUOP,
    output reg  MemToWrite,
	output reg  ALUSrc,
    output reg  RegWrite
);
//2. Definir elementos internos del modulo 
//3. Declarar los procesos secuenciales, asignaciones y/o instancias
always@(*)
	begin
	  case(inst)
	   6'd0: //Tipo R
		begin
		  RegDst = 1'b1;
		  Branch = 1'b0;
		  MemRead = 1'b0;
		  MemToRg = 1'b0;
		  ALUOP = 3'b000;
		  MemToWrite = 1'b0;
		  ALUSrc = 1'b0;
		  RegWrite = 1'b1;
		end

		6'b000010: //ADDI
			begin
			  RegDst = 1'b0;
			  Branch = 1'b0;
			  MemRead = 1'b0;
			  MemToRg = 1'b0;
			  ALUOP = 3'b001;
			  MemToWrite = 1'b0;
			  ALUSrc = 1'b1; // Ahora en lugar de leer de memoria, se lee el que viene en la instrucción
			  RegWrite = 1'b1;
			end

	  default: ALUOP = 3'b0;
	endcase
end
endmodule

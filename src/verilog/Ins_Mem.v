//1. Declaracion modulos de salida
module inst_mem (
    input wire [4:0] ReadAddr,
    output reg [31:0] Instruccion
);
//2. Definir elementos internos del modulo 

reg [7:0] memoria[0:31];

//3. Declarar los procesos secuenciales, asignaciones y/o instancias
always@(*)
	begin
		memoria[ReadAddr] = Instruccion[31:24];
		memoria[ReadAddr + 1] = Instruccion[23:16];
		memoria[ReadAddr + 2] = Instruccion [15:8];
		memoria[ReadAddr + 3] = Instruccion [7:0];
	  
	end
endmodule

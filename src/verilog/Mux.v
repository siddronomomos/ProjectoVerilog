//1. Declaracion modulos de salida
module Mux(
	input wire[31:0]OP1,
	input wire[31:0]OP2,
	input wire selM,
	output reg[31:0]res
);
//2. Definir elementos internos del modulo 
//3. Declarar los procesos secuenciales, asignaciones y/o instancias
always @* begin
    if (selM == 1'b0) 
        res= OP1; // Si select es 0, la salida es op1
    else                
        res = OP2;// Si select es 1, la salida es op2
end

endmodule
//1. Declaracion modulos de salida
module Shift_L_2 (
    input [31:0] in_data,
    output reg [31:0] out_data
);
//2. Definir elementos internos del modulo 
//NA

//3. Declarar los procesos secuenciales, asignaciones y/o instancias

always@(*)
    begin
        out_data = in_data << 2;
    end

endmodule
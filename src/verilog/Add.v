//1. Declaracion modulos de salida
module Add (
    input [31:0] in_address,
    input [31:0] sumador,
    output reg [31:0] out_address
);
//2. Definir elementos internos del modulo 


//3. Declarar los procesos secuenciales, asignaciones y/o instancias

always@(*)
    begin
        out_address = in_address + sumador;
    end

endmodule

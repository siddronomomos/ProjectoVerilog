//1. Declaracion modulos de salida
module And (
    input operando1,
    input operando2,
    output reg resultado
);
//2. Definir elementos internos del modulo 


//3. Declarar los procesos secuenciales, asignaciones y/o instancias

always@(*)
    begin
        resultado = operando1 & operando2;
    end

endmodule

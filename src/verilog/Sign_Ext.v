//1. Declaracion modulos de salida
module Sign_Ext (
    input [15:0] in_data,
    output reg [31:0] out_data
);
//2. Definir elementos internos del modulo 


//3. Declarar los procesos secuenciales, asignaciones y/o instancias

assign out_data = {{16{in_data[15]}}, in_data};

endmodule

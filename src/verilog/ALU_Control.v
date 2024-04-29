module ControladorALU (
    input wire [5:0] bits_instruccion, // Entrada de 6 bits de la instrucción
    input wire[2:0] codigo_UC,         // Entrada de 3 bits de la UC
    output reg [2:0] senial_ALU    // Salida de 3 bits para la ALU
);

// Parámetros para los códigos de operación de la ALU
parameter ADD = 3'b000;
parameter SUB = 3'b001;
parameter AND = 3'b010;
parameter OR  = 3'b011;
parameter NOR = 3'b100;
parameter SLT = 3'b101;
parameter NOP = 3'b111; // No operation (ninguna operación)

// Definición de señales para operaciones R
reg operacion_R;

always @* begin
    // Verifica si la instrucción es tipo R (asumiendo que el código de operación R es 3'b000)
    if (codigo_UC == 3'b000) begin
        operacion_R = 1'b1; // La instrucción es tipo R
    end else begin
        operacion_R = 1'b0; // La instrucción no es tipo R
    end

    // Dependiendo del código de la UC y si la instrucción es tipo R, asigna la señal correspondiente para la ALU
    case (codigo_UC)
        3'b000: senial_ALU = NOP; // No operation
        3'b001: senial_ALU = NOP; // No operation
        3'b010: senial_ALU = NOP; // No operation
        3'b011: senial_ALU = NOP; // No operation
        3'b100: senial_ALU = NOP; // No operation
        3'b101: senial_ALU = NOP; // No operation
        3'b110: senial_ALU = NOP; // No operation
        3'b111: begin // Dependiendo de la instrucción tipo R o no, asigna la operación correspondiente
            if (operacion_R) begin // Si es una instrucción tipo R
                // Asigna la señal de operación de acuerdo a los bits 5:0 de la instrucción
                case (bits_instruccion)
                    6'b100000: senial_ALU = ADD; // Si la instrucción es ADD
                    6'b100010: senial_ALU = SUB; // Si la instrucción es SUB
                    6'b100100: senial_ALU = AND; // Si la instrucción es AND
                    6'b100101: senial_ALU = OR; // Si la instrucción es OR
                    6'b100110: senial_ALU = NOR; // Si la instrucción es XOR
					6'b101010: senial_ALU = SLT; //Si la instrucción es STL
                    default: senial_ALU = NOP; // Cualquier otro caso, no realiza operación
                endcase
            end else begin // Si no es una instrucción tipo R
                senial_ALU = NOP; // No operation
            end
        end
    endcase
end

endmodule


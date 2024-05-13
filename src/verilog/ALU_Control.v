module ControladorALU (
    input wire [5:0] bits_instruccion, // Entrada de 6 bits de la instruccion
    input wire[2:0] codigo_UC,         // Entrada de 3 bits de la UC
    output reg [2:0] senial_ALU    // Salida de 3 bits para la ALU
);

// Parametros para los codigos de operacion de la ALU
parameter ADD = 3'b000;
parameter SUB = 3'b001;
parameter AND = 3'b010;
parameter OR  = 3'b011;
parameter NOR = 3'b100;
parameter SLT = 3'b101;
parameter NOP = 3'b111; // No operation (ninguna operacion)

// Definicion de seniales para operaciones R
reg operacion_R;

always @* begin
    // Verifica si la instruccion es tipo R (asumiendo que el codigo de operacion R es 3'b000)
    if (codigo_UC == 3'b000) begin
        operacion_R = 1'b1; // La instruccion es tipo R
    end else begin
        operacion_R = 1'b0; // La instruccion no es tipo R
    end

    // Dependiendo del codigo de la UC y si la instruccion es tipo R, asigna la senial correspondiente para la ALU
    case (codigo_UC)
        3'b000: senial_ALU = NOP; // No operation
        3'b001: senial_ALU = NOP; // No operation
        3'b010: senial_ALU = NOP; // No operation
        3'b011: senial_ALU = NOP; // No operation
        3'b100: senial_ALU = NOP; // No operation
        3'b101: senial_ALU = NOP; // No operation
        3'b110: senial_ALU = NOP; // No operation
        3'b111: begin // Dependiendo de la instruccion tipo R o no, asigna la operacion correspondiente
            if (operacion_R) begin // Si es una instruccion tipo R
                // Asigna la senial de operacion de acuerdo a los bits 5:0 de la instruccion
                case (bits_instruccion)
                    6'b100000: senial_ALU = ADD; // Si la instruccion es ADD
                    6'b100010: senial_ALU = SUB; // Si la instruccion es SUB
                    6'b100100: senial_ALU = AND; // Si la instruccion es AND
                    6'b100101: senial_ALU = OR; // Si la instruccion es OR
                    6'b100110: senial_ALU = NOR; // Si la instruccion es XOR
					6'b101010: senial_ALU = SLT; //Si la instruccion es STL
                    default: senial_ALU = NOP; // Cualquier otro caso, no realiza operacion
                endcase
            end else begin // Si no es una instruccion tipo R
                senial_ALU = NOP; // No operation
            end
        end
    endcase
end

endmodule

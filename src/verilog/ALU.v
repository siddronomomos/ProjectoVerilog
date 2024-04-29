//1. Declaracion modulos de salida
module ALU(
	input wire[31:0]op1,
	input wire[31:0]op2,
	input wire[2:0]sel,
	output reg[31:0]res,
	output ZF
);
//2. Definir elementos internos del modulo 
	reg [31:0]ALU_Resultados;
	wire [8:0]tmp;
	assign res = ALU_Resultados;
	assign tmp = {1'b0,op1} + {1'b0,op2};
	assign ZF = tmp[8];

//3. Declarar los procesos secuenciales, asignaciones y/o instancias
always@(*)
	begin
	case(sel)
	   3'b010: //AND
	      ALU_Resultados = op1 & op2;
	   3'b011: //OR
	      ALU_Resultados = op1 | op2;
	   3'b000: //ADD
	      ALU_Resultados = op1 + op2;
	   3'b001: //SUB
	      ALU_Resultados = op1 - op2;
	   3'b101: //SLT
	      ALU_Resultados = (op1 < op2) ? 1 : 0;
	   3'b100: //NOR
	      ALU_Resultados = ~(op1 | op2);
	   default: 
		  ALU_Resultados = 32'dx; // Pone el resultado como indeterminado
	endcase
end
endmodule

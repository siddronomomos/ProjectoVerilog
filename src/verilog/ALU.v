//1. Declaracion modulos de salida
module ALU(
	input wire[31:0]op1,
	input wire[31:0]op2,
	input wire[3:0]sel,
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
	   4'b0000:
	      ALU_Resultados = op1 & op2;
	   4'b0001:
	      ALU_Resultados = op1 | op2;
	   4'b0010:
	      ALU_Resultados = op1 + op2;
	   4'b0110:
	      ALU_Resultados = op1 - op2;
	   4'b0111:
	      ALU_Resultados = ~(op1 < op2);
	   4'b1100:
	      ALU_Resultados = ~(op1 | op2);
	   default: ALU_Resultados = op1 - op2;
	endcase
end
endmodule

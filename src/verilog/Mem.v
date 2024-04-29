module ram(
	input wire opM,
	input wire[31:0] pos,
	input wire[31:0]valor,
	output reg [31:0]salida
);
reg [31:0]A[0:9];
initial
	begin
	   $readmemb("Datos.txt",A);
	end
always @*
	begin
	   if(opM)//op == 1 -> Guarda
		begin
		    A[pos]=valor;
		end
	   else//leer
		begin
		    salida=A[pos];
		end
	end
endmodule

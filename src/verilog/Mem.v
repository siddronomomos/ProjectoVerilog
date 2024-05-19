module ram(
	input wire opM,
	input wire[31:0] pos,
	input wire[31:0]valor,
	output reg [31:0]salida
	input wire opR
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
	end
always @* 
	begin
		if (opR) begin       
			salida = A[pos];
		end else begin
			salida = 32'b0;      
		end
	end
endmodule

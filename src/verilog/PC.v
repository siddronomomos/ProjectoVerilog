`timescale 1ns/1ns
//1. Declaracion modulos de salida
module PC (
    input [31:0] in_address,
    output reg [31:0] out_address
);
//2. Definir elementos internos del modulo 

reg clk;

//3. Declarar los procesos secuenciales, asignaciones y/o instancias

initial
	begin
		clk = 1'b0;
		forever #100
		clk=~clk;
	end

initial
    begin
        out_address = 32'b0;
    end

always@(posedge clk)
    begin
        out_address = in_address;
    end

endmodule

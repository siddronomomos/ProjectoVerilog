`timescale 1ns/1ns

module Intrucciones_TR_TB();
    // Señales de entrada
    reg [31:0] TR;
    // Señales de salida
    wire TR_ZF;

    // Instancia del DUT (Design Under Test)
    Intrucciones_TR dut (
        .TR(TR),
        .TR_ZF(TR_ZF)
    );
    // Generación de estímulos
    initial begin
  // Asigna valores a TR para simular diferentes casos de prueba
        TR = 32'h00000001; // Ejemplo de un valor para TR
	
// Asigna valores a los campos de la instrucción
	TR[31:26] = 6'd0;
        TR[25:21] = 5'd10; // Dirección del primer operando
        TR[20:16] = 5'd11; // Dirección del segundo operando
        TR[15:11] = 5'd12; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100000; // Especifica la operación de suma usando el parámetro ADD
        #100; // Espera un tiempo para la estabilización de la salida
	
	TR[31:26] = 6'd0;
	TR[25:21] = 5'd10; // Dirección del primer operando
        TR[20:16] = 5'd11; // Dirección del segundo operando
        TR[15:11] = 5'd12; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100010; // Especifica la operación de suma usando el parámetro SUB
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd10; // Dirección del primer operando
        TR[20:16] = 5'd11; // Dirección del segundo operando
        TR[15:11] = 5'd12; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100100; // Especifica la operación de suma usando el parámetro AND
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd10; // Dirección del primer operando
        TR[20:16] = 5'd11; // Dirección del segundo operando
        TR[15:11] = 5'd12; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 3'b011; // Especifica la operación de suma usando el parámetro OR
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd10; // Dirección del primer operando
        TR[20:16] = 5'd11; // Dirección del segundo operando
        TR[15:11] = 5'd12; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100101; // Especifica la operación de suma usando el parámetro NOT
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd10; // Dirección del primer operando
        TR[20:16] = 5'd11; // Dirección del segundo operando
        TR[15:11] = 5'd12; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100110; // Especifica la operación de suma usando el parámetro SLT
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd3; // Dirección del primer operando
        TR[20:16] = 5'd4; // Dirección del segundo operando
        TR[15:11] = 5'd5; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b101010; // Especifica la operación de suma usando el parámetro ADD
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd3; // Dirección del primer operando
        TR[20:16] = 5'd4; // Dirección del segundo operando
        TR[15:11] = 5'd5; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100010; // Especifica la operación de suma usando el parámetro SUB
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd3; // Dirección del primer operando
        TR[20:16] = 5'd4; // Dirección del segundo operando
        TR[15:11] = 5'd5; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100101; // Especifica la operación de suma usando el parámetro NOT
        #100; // Espera un tiempo para la estabilización de la salida

	TR[31:26] = 6'd0;
	TR[25:21] = 5'd3; // Dirección del primer operando
        TR[20:16] = 5'd4; // Dirección del segundo operando
        TR[15:11] = 5'd5; // Dirección donde se guardará el resultado
        TR[10:6] = 6'b000000; // Shift amount, en este caso está en 0
        TR[5:0] = 6'b100100; // Especifica la operación de suma usando el parámetro AND
        #100; // Espera un tiempo para la estabilización de la salida
        $finish;
    end

endmodule


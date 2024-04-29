module Intrucciones_TR(
    input wire [31:0] TR,
    output reg TR_ZF
);

// Declaración de los fragmentos de la instrucción

wire [32:0]C1;
wire [32:0]C2;
wire [32:0]C3;
wire [2:0]C4;
wire [32:0]C5;

Unida_control Unida_control(
    .inst(TR[31:26]),  
    .MemToRg(selM),//salidas
    .MemToWrite(opM),
    .RegWrite(RegEn),
    .ALUOP(codigo_UC)
);
BR BR(
    .RA1(TR[25:21]),
    .RA2(TR[20:16]),
    .Di(res),
    .Dir(TR[15:11]),
    .RegEn(RegWrite),
    .DR1(C2),//salidas
    .DR2(C1)
);
ControladorALU ControladorALU(
    .bits_instruccion(TR[5:0]),
    .codigo_UC(ALUOP),
    .senial_ALU(C4)
);
ALU ALU(
    .op1(C2),
    .op2(C1),
    .sel(C4),
    .res(C3),//salidas
    .ZF(TR_ZF)
);
ram ram(
    .opM(MemToWrite),
    .pos(C3),
    .valor(C1),
    .salida(C5)
);
Mux Mux(
    .OP1(C1),
    .OP2(C5),
    .selM(MemToRg),
    .res(Dir)
);
endmodule
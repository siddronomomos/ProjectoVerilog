//1. Declaracion modulos de salida
module Conector ();
//2. Definir elementos internos del modulo 

wire [31:0]C1; // Mux 2 -> PC
wire [31:0]C2; // PC -> Adder 4 y PC -> Inst Mem
wire [31:0]C3; // Adder 4 -> Adder y adder 4 -> mux 2
wire [31:0]C4; // Sign_Ext -> Shift_L_2 y Sign_Ext -> Mux 3
wire [31:0]C5; // Shift_L_2 -> Adder
wire [31:0]C6; // Adder -> Mux 2
wire [31:0]C7; // BR -> ALU y BR -> Mem
wire [31:0]C8; // BR -> Mux 3
wire [2:0]C9; // ControladorALU -> ALU
wire [31:0]C10; // Mux 3 -> ALU
wire [31:0]C11; // ALU -> Mux 4
wire C12; // ZF -> AND
wire [31:0]C13; // Mem -> Mux 4
wire [31:0]C14; // Mux 4 -> BR
wire C15; // AND -> Mux 2
wire C16; // Unidad_control -> Mux 1
wire C17; // Unidad_control -> AND
wire C18; // Unidad_control -> Mem
wire C19; // Unidad_control -> Mux 4
wire [2:0]C20; // Unidad_control -> ControladorALU
wire C21; // Unidad_control -> Mem
wire C22; // Unidad_control -> Mux 3
wire C23; // Unidad_control -> BR

wire [31:0]TR;

//3. Declarar los procesos secuenciales, asignaciones y/o instancias

PC PC(
    .in_address(C1),
    .out_address(C2)
);

Add Add4(
    .in_address(C2),
    .sumador(32'd4),
    .out_address(C3)
);

inst_mem inst_mem(
    .ReadAddr(C2),
    .Instruccion(TR)
);

Mux Mux1(
    .OP1(TR[20:16]),
    .OP2(TR[15:11]),
    .selM(C16),
    .res(Dir)
);

BR BR(
    .RA1(TR[25:21]),
    .RA2(TR[20:16]),
    .Di(C14),
    .Dir(TR[15:11]),
    .RegEn(C23),
    .DR1(C7),
    .DR2(C8)
);

Sign_Ext Sign_Ext(
    .in_data(TR[15:0]),
    .out_data(C4)
);

Shift_L_2 Shift_L_2(
    .in_data(C4),
    .out_data(C5)
);

Add Add(
    .in_address(C3),
    .sumador(C5),
    .out_address(C6)
);

Mux Mux2(
    .OP1(C3),
    .OP2(C6),
    .selM(C15),
    .res(C1)
);

Mux Mux3(
    .OP1(C8),
    .OP2(C4),
    .selM(C22),
    .res(C10)
);

ControladorALU ControladorALU(
    .bits_instruccion(TR[5:0]),
    .codigo_UC(C20),
    .senial_ALU(C9)
);

ALU ALU(
    .op1(C7),
    .op2(C10),
    .sel(C9),
    .res(C11),
    .ZF(C12)
);

ram ram(
    .MemRead(C18),
    .MemWrite(C21),
    .pos(C11),
    .valor(C7),
    .salida(C13)
);

Mux Mux4(
    .OP1(C11),
    .OP2(C13),
    .selM(C19),
    .res(C14)
);

And And(
    .operando1(C12),
    .operando2(C17),
    .resultado(C15)
);

Unida_control Unidad_control(
    .inst(TR[31:26]),
    .RegDst(C16),
    .Branch(C17),
    .MemRead(C18),
    .MemToRg(C19),
    .ALUOP(C20),
    .MemToWrite(C21),
    .ALUSrc(C22),
    .RegWrite(C23)
);

endmodule

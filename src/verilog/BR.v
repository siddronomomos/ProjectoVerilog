module BR (
    input wire [4:0] RA1,
    input wire [4:0] RA2,
    input wire [31:0] Di,
    input wire [4:0] Dir,
    input wire RegEn,
    output reg [31:0] DR1,
    output reg [31:0] DR2
);


// Declaracion de los registros
reg [32-1:0] registros[32-1:0];

// Proceso para la lectura y escritura de los registros

initial begin
    $readmemb("Datos.txt", registros);
end

always @(*) begin
    if (RegEn) begin
        registros[Dir] <= Di;
    end
    DR1 <= registros[RA1];
    DR2 <= registros[RA2];
end

endmodule

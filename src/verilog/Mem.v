module ram(
	input wire MemRead,
	input wire MemWrite,
	input wire[31:0] pos,
	input wire[31:0]valor,
	output reg [31:0]salida
);
reg [31:0]A[0:9];

always @*
	begin
		if(MemWrite)
			A[pos]<=valor;
		if(MemRead)
			salida<=A[pos];
		
	end
endmodule

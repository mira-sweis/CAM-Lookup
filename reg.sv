module register(input logic clk, en, 
		input logic [3:0] D,
		output logic [3:0] Q);

always_ff @ (posedge clk) begin
	if (en)
		Q <= D;
end

endmodule

module p_encoder(input logic [7:0] valids,
		 output logic [2:0] addr);

always_comb begin
	casex(valids)
		8'b1xxxxxxx: addr = 3'b111;
		8'bx1xxxxxx: addr = 3'b110;
		8'bxx1xxxxx: addr = 3'b101;
		8'bxxx1xxxx: addr = 3'b100;
		8'bxxxx1xxx: addr = 3'b011;
		8'bxxxxx1xx: addr = 3'b010;
		8'bxxxxxx1x: addr = 3'b001;
		8'bxxxxxxx1: addr = 3'b000;
		default: addr = 3'b0;
	endcase
end

endmodule

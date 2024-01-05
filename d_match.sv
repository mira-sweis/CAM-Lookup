module d_match(input logic [3:0] q, d_addr,
	       output logic valid);

assign valid = (q == d_addr);

endmodule

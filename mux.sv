module mux(input logic init, valid, setD,
	   input logic [3:0] d_in, constant,
	   output logic[3:0] D,
	   output logic en);

assign en = init | (valid & setD);

assign D = (init) ? constant : d_in;

endmodule

module CAM(input logic clk, setD, init,
	   input logic [3:0] D_lookup, newD,
	   output logic valid,
	   output logic [2:0] max_addr, min_addr);

logic [2:0] min_addr_not;
logic [7:0] en, v, v_rev;
logic [3:0] q0, q1, q2, q3, q4, q5, q6, q7;
logic [3:0] d0, d1, d2, d3, d4, d5, d6, d7;

register in1(clk, en[0], d0, q0);
register in2(clk, en[1], d1, q1);
register in3(clk, en[2], d2, q2);
register in4(clk, en[3], d3, q3);
register in5(clk, en[4], d4, q4);
register in6(clk, en[5], d5, q5);
register in7(clk, en[6], d6, q6);
register in8(clk, en[7], d7, q7);

mux ins1(init, v[0], setD, newD, 4'b1000, d0, en[0]);
mux ins2(init, v[1], setD, newD, 4'b1001, d1, en[1]);
mux ins3(init, v[2], setD, newD, 4'b1010, d2, en[2]);
mux ins4(init, v[3], setD, newD, 4'b1011, d3, en[3]);
mux ins5(init, v[4], setD, newD, 4'b1100, d4, en[4]);
mux ins6(init, v[5], setD, newD, 4'b1101, d5, en[5]);
mux ins7(init, v[6], setD, newD, 4'b1110, d6, en[6]);
mux ins8(init, v[7], setD, newD, 4'b1111, d7, en[7]);

d_match inst1(q0, D_lookup, v[0]);
d_match inst2(q1, D_lookup, v[1]);
d_match inst3(q2, D_lookup, v[2]);
d_match inst4(q3, D_lookup, v[3]);
d_match inst5(q4, D_lookup, v[4]);
d_match inst6(q5, D_lookup, v[5]);
d_match inst7(q6, D_lookup, v[6]);
d_match inst8(q7, D_lookup, v[7]);

assign v_rev = {v[7], v[6], v[5], v[4], v[3], v[2], v[1], v[0]};

p_encoder i1(v, max_addr);
p_encoder i2(v_rev, min_addr_not);

assign min_addr = ~min_addr_not;
assign valid = v[0] | v[1] | v[2] | v[3] | v[4] | v[5] | v[6] | v[7];

endmodule

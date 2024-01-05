module testbench();

logic clk, init, setD, valid;
logic [2:0] max_addr, min_addr;
logic [3:0] D_lookup, newD;

CAM dut(clk, setD, init, D_lookup, newD, valid, max_addr, min_addr);

  // generate clock to sequence tests
always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

initial begin
init = 1; #20;
init = 0; setD = 0; D_lookup = 4'b1011; #20;
init = 0; setD = 1; D_lookup = 4'b1011; newD = 4'b1110; #20;
init = 0; setD = 0; D_lookup = 4'b1110; #20;
init = 0; setD = 1; D_lookup = 4'b1110; newD = 4'b1010; #20;
end

endmodule

module testbench_LED();
logic clk, reset;
logic X;
logic la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
      ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl;

LED dut(clk, reset, la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                    ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl);

always
    begin 
        clk = 1; #5;
        clk = 0; #5;
    end

    initial 
        begin
            X = 1'b0; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
            X = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S1"); end
            X = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S2"); end
            X = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
            X = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S1"); end
            X = 1'b0; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
            X = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
        end

endmodule
module LED_testbench();
logic clk, clkc, reset;
logic A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R;
logic [17:0] ledR;
logic [7:0] ledG;

    LED dut(clk, clkc, reset, in, ledR, ledG);

    always begin 
        clkc = 1; #5;
        clkc = 0; #5;
    end

    initial begin
        #10; reset = 1; 
        #10; reset = 0; R = 1;
        #10; reset = 1;
        #10; reset = 0; R = 1;
        #10; reset = 1;
        #10; reset = 0; Q = 1;
        #10; reset = 1;
        #10; reset = 0;
        #10; reset = 1;
    end
endmodule














/*module LED_testbench();
logic clk, clkc;
logic [17:0] in;
logic [17:0] ledR;
logic [7:0] ledG;

    LED dut(clk, clkc, in, ledR, ledG);

    always begin 
        clkc = 1; #5;
        clkc = 0; #5;
    end

    initial begin
        #10; in = 18'b10_0000_0000_0000_0000_0000;
        #10; in = 18'b10_0000_0000_0000_0000_0001;
        #10; in = 18'b10_0000_0000_0000_0000_0010;
    end

endmodule*/







/*module testbench_LED();
logic clk, reset;
logic A, B, C, D;
logic la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
      ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl;

LED dut(A, B, C, D, clk, reset, la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                    ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl);

always
    begin 
        clk = 1; #5;
        clk = 0; #5;
    end

    initial 
        begin
            A = 1'b0; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
            A = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S1"); end
            A = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S2"); end
            A = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
            A = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S1"); end
            A = 1'b0; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
            A = 1'b1; reset = 1'b1; reset = 1'b0; #10
            if (~reset) begin $display("S0"); end
        end

endmodule
*/
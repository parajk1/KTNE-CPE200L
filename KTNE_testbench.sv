module KTNE_testbench();

//LED
logic clkc;            
logic reset;   
logic [0:0] A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R;
logic [17:0] ledR;
logic [7:0] ledG;

//TIMER 
logic clk_in;   
logic [6:0] segA;    
logic [6:0] segB;   
logic [6:0] segC;  

//creates an object from the KTNE module
KTNE dut(
        clkc, 
        reset, 
        A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R,
        ledR,
        ledG,

        clk_in,
        segA,
        segB,
        segC
        );

    //Clock
    always begin 
        clkc = 1; #5;
        clk_in = 1; 
        clkc = 0; #5;
        clk_in = 0;
    end

    //Inputs the each switch to 1 after 10 ps.
    //Reset stays at 1 to prevent from defaulting back to the first state
    initial begin
        #10; reset = 0;
        #10; R = 1; reset = 1;
        #10; F = 1; H = 1; reset = 1;
        #10; O = 1; G = 1; reset = 1;
        #10; J = 1; C = 1; L = 1; reset = 1;
        #10; E = 1; I = 1; M = 1; reset = 1;   
        #10; D = 1; P = 1; N = 1; reset = 1;
        #10;  B = 1; A = 1; Q = 1; K = 1; reset = 1;
    end



endmodule

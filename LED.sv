//[3:0] pushbuttons - restart (3secs), pause, cheatmode, input results
//[17:00] SW - input answers
//


//LED lights for KTNE
module LED( 
            input logic clk,             //CLOCK_50
            input logic clkc,            //SW0
            input logic reset,           //SW1
            input logic [0:0] A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R,
            output logic [17:0] ledR,    //LEDR
            output logic [7:0] ledG);    //LEDG

    //Added more logic
    logic [3:0] data1 = 4'b0001; //Provide random numbers
    logic [3:0] data2 = 4'b0001; //in Hexidecimal
    logic [1:0] data7 = 2'b01;
    
    //Added states
    typedef enum logic [3:0] {S0, S1, S2, S3} statetype;
    statetype state, nextstate;

    //To set the default state as 0
    localparam [25:0] r_zero = 25'b0000_0000_0000_0000_0000_0000_01;

    //For every clkc inputted
    always @ (posedge clkc) begin
        //generate a random number
        data1 <= {data1[3:0], data1[1] ^ data1[2]};
        data2 <= {data2[3:0], data2[3] ^ data2[0]};
        data7 <= {data7[1:0], data7[1] ^ data7[0]};
    end

    always_ff @ (posedge clkc) begin
        //Moves the states whenever clkc is 1
        if(reset) begin state = S0; end
        else      begin state = nextstate; end

        //Depending on the state, it moves to the next if the correct switch is flipped
        case(state)
                S0:     if (A)         nextstate = S1;
                        else           nextstate = S0;
                S1:     if (B)         nextstate = S2;
                        else           nextstate = S0;
                S2:     if (C)         nextstate = S3;
                        else           nextstate = S0;
                S3:                    nextstate = S0;
        endcase

        //Furthermore, each state has it's own specific random LED sequence
        case(state)
                S0: {ledR, ledG} <= r_zero;
                S1: {ledR, ledG} <= {data7, data1, data2, data1, data2, data1, data2};
                S2: {ledR, ledG} <= {data7, data1, data2, data1, data2, data1, data2};
                S3: {ledR, ledG} <= {data7, data1, data2, data1, data2, data1, data2};
        endcase
    end

endmodule





/*

module LED( input logic clk, clkc,
            input logic [17:0] in,
            output logic [17:0] ledR,
            output logic [7:0] ledG
           );

    logic [17:0] data1 = 18'hbcdf;
    logic [7:0]  data2 = 8'hff;

    typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;
    statetype state, nextstate;


    //The Cheat Sheet
    localparam [17:0] r_0 = 18'b10_0000_0000_0000_0000_0000;
    localparam [17:0] r_1 = 18'b00_0000_0000_0000_0000_0001;
    localparam [17:0] r_2 = 18'b00_0000_0000_0000_0000_0010;
    localparam [17:0] r_3 = 18'b00_0000_0000_0000_0000_0100;
    localparam [17:0] r_4 = 18'b00_0000_0000_0000_0000_1000;
    localparam [17:0] r_5 = 18'b00_0000_0000_0000_0001_0000;
    localparam [17:0] r_6 = 18'b00_0000_0000_0000_0010_0000;
    localparam [17:0] r_7 = 18'b00_0000_0000_0000_0100_0000;
    localparam [17:0] r_8 = 18'b00_0000_0000_0000_1000_0000;
    localparam [17:0] r_9 = 18'b00_0000_0000_0001_0000_0000;




    always_ff @ (posedge clkc) begin
        state = nextstate;
    
        data1 <= {data1[14:0], data1[17] ^ data1[1] ^ data1[14] ^ data1[5] ^ data1[15]};
        data2 <= {data2[4:0] ,data2[7] ^ data2[6] ^ data2[5]};

        //LED outputs 
        case(state)
                S0: assign {ledR, ledG} = {data1[17:0], data2[7:0]};
                S1: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S2: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S3: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S4: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S5: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S6: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S7: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S8: {ledR, ledG} = {data1[17:0], data2[7:0]};
                S9: {ledR, ledG} = {data1[17:0], data2[7:0]};
        endcase

    //LED inputs (at any point player fails)
        case(state)
                S0:     if (in == r_1) state = nextstate;
                        else           state = S0;
                S1:     if (in == r_1) state = nextstate;
                        else           state = S0;
                S2:     if (in == r_2) state = nextstate;
                        else           state = S0;
                S3:     if (in == r_3) state = nextstate;
                        else           state = S0;
                S4:     if (in == r_4) state = nextstate;
                        else           state = S0;
                S5:     if (in == r_5) state = nextstate; 
                        else           state = S0; 
                S6:     if (in == r_6) state = nextstate;
                        else           state = S0;
                S7:     if (in == r_7) state = nextstate;
                        else           state = S0;
                S8:     if (in == r_8) state = nextstate;
                        else           state = S0;
                S9:     if (in == r_9) state = nextstate;
                        else           state = S0;
        endcase
    

    //Plays checks the correct switches to input

    end

    always @ (clk) begin
        case(state)
              S0: {ledR, ledG} = {r_0, 8'b0};
              S1: {ledR, ledG} = {r_1, 8'b0};
              S2: {ledR, ledG} = {r_2, 8'b0};
              S3: {ledR, ledG} = {r_3, 8'b0};
              S4: {ledR, ledG} = {r_4, 8'b0};
              S5: {ledR, ledG} = {r_5, 8'b0};
              S6: {ledR, ledG} = {r_6, 8'b0};
              S7: {ledR, ledG} = {r_7, 8'b0};
              S8: {ledR, ledG} = {r_8, 8'b0};
              S9: {ledR, ledG} = {r_9, 8'b0};
        endcase
    end

endmodule















/*module LED(input logic  A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R,
           input logic clk, reset,       
           output logic la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
           output logic ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl);

    typedef enum logic [3:0] {S0, S1, S2, S3, S4} statetype;
    statetype state, nextstate;

    always_ff @ (posedge clk, posedge reset)
            if(reset)    state = S0;
            else         state = nextstate;
        
        always_comb
            case(state)
                S0: if (A&B&C&D) nextstate = S1;
                    else    nextstate = S0;
                S1: if (E&F&G&H) nextstate = S2;
                    else    nextstate = S0;
                S2: if (I&J&K&L)  nextstate = S3;
                    else    nextstate = S0;
                S3: if (L&M&N&O&P) nextstate = S4;
                    else    nextstate = S0;
                S4:         nextstate = S0;
                default:    nextstate = S0;
            endcase


    always_comb 
        case(state)
            S0: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 26'b1111_1111_1111_1111_1111_1111_111;
            
            S1: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 26'b1011_1011_1101_1101_0111_1101_111;

            S2: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 26'b1001_0011_1001_1001_0101_0101_100;

            S3: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 26'b1001_0010_1001_1000_0100_0001_000;

            S4: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 26'b0000_0000_0000_0000_0000_0000_000;

            default: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 26'b0000_0000_0000_0000_0000_0000_000;
        endcase

endmodule*/
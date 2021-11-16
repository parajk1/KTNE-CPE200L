//Will allow access to LEDR[17:0] and LEDG[5:0]
/*module alu{input logic [24:0] A, B,
           input logic [2:0] ALUControl,
           output logic [24:0] Result);

    always @ (*) begin
        case(ALUControl)
            3'b000:                     Result = A+B;
            3'b001:                     Result = A+~B;
            3'b010:                     Result = A&B;
            3'b011:                     Result = A|B;
            3'b101:    if(~ALUControl)  Result = 24'b1;
                       else             Result = 24'b0;    
            default:                    Result = 0;
        endcase
    end 

endmodule*/


module LED(input logic  A, B,
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
                S0: if (A&B) nextstate = S1;
                    else    nextstate = S0;
                S1: if (A&B) nextstate = S2;
                    else    nextstate = S0;
                S2: if (A)  nextstate = S3;
                    else    nextstate = S0;
                S3: if (A&B) nextstate = S4;
                    else    nextstate = S0;
                S4:         nextstate = S0;
                default:    nextstate = S0;
            endcase


    always_comb 
        case(state)
            S0: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 25'b1111_1111_1111_1111_1111_1111_111;
            
            S1: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 25'b1011_1011_1101_1101_0111_1101_111;

            S2: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 25'b1001_0011_1001_1001_0101_0101_100;

            S3: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 25'b1001_0010_1001_1000_0100_0001_000;

            S4: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 25'b0000_0000_0000_0000_0000_0000_000;

            default: {la, lb, lc, ld, le, lf, lg, lh, li, lj, lk, ll, lm,
                ra, rb, rc, rd, re, rf, rg, rh, ri, rj, rk, rl}         = 25'b0000_0000_0000_0000_0000_0000_000;
        endcase

endmodule
/*
//Example module to use the Osciallator in FPGA board
//KEEP AS REFERENCE

module timer_wrapper(input logic CLOCK_50,
                    output logic [0:0] LEDR );
   timer tb(CLOCK_50, LEDR[0]);
endmodule*/ 


//wrapper for the timer
module timer_wrapper(
                     input logic  CLOCK_50,   //access the real clock in the FPGA board
                     output logic [6:0] HEX2, //access the HEX values 
                     output logic [6:0] HEX1,
                     output logic [6:0] HEX0 );

    //instantiates
    timer tb(CLOCK_50,
             HEX2, 
             HEX1, 
             HEX0);

endmodule





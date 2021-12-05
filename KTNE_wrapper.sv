module KTNE_wrapper(
            //LED Part
            input logic [1:0] KEY,
            input logic [17:0] SW,
            output logic [17:0] LEDR,
            output logic [7:0] LEDG,

            //TIMER Part
            input logic CLOCK_50,
            output logic [6:0] HEX2,
            output logic [6:0] HEX1,
            output logic [6:0] HEX0
            );

    //Assigning the correct pins into the DE2 board. 
    //Also used the de2_115.qsf file, to import the correct pins.
    KTNE tb(
            KEY[0], 
            KEY[1],

            SW[0], SW[1], SW[2], SW[3], SW[4], SW[5], SW[6], SW[7], SW[8], SW[9], SW[10], 
            SW[11], SW[12], SW[13], SW[14], SW[15], SW[16], SW[17],

            LEDR, 
            LEDG,

            CLOCK_50,
            HEX2, 
            HEX1, 
            HEX0
            );


endmodule

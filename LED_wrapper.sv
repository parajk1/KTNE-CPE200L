module LED_wrapper(input logic  [2:0] KEY, 
                   /*input logic  [2:0] SW,*/
                   output logic [17:0] LEDR,
                   output logic [7:0] LEDG);


    LED tb
    (KEY[0], KEY[1], KEY[2],
    LEDR[17],LEDR[16],LEDR[15],LEDR[14],LEDR[13],LEDR[12],LEDR[11],LEDR[10],LEDR[9],LEDR[8],LEDR[7],LEDR[6],LEDR[5],LEDR[4],
    LEDR[3],LEDR[2],LEDR[1],LEDR[0],LEDG[7],LEDG[6],LEDG[5],LEDG[4],LEDG[3],LEDG[2],LEDG[1],LEDG[0]);

endmodule
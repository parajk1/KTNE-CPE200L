

/*module timer_testbench();

    // Inputs
    logic Clk_1sec;
    //logic reset;

    // Outputs
    logic [5:0] seconds;
    logic [6:0] segA;
    logic [6:0] segB;
    logic [6:0] segC;

    // Instantiate the Unit Under Test (UUT)
    timer dut ( Clk_1sec, 
                //reset, 
                seconds, 
                segA, segB, segC);
    
    //Generating the Clock with `1 Hz frequency
    initial Clk_1sec = 0;
    always #50 Clk_1sec = ~Clk_1sec;  //Every 0.5 sec toggle the clock.
    //#5000000

    initial begin
        reset = 1;
        // Wait 100 ns for global reset to finish
        #100;
        reset = 0;  
    end
      
endmodule
*/

module timer_testbench();
logic clk;
logic sw;
logic rst;
logic [6:0] seg;
logic [3:0] an;
logic [7:0] led;

timer dut (clk, sw, rst, seg, an, led);

initial begin clk = 0; sw = 1; end
always #50 clk = ~clk;

initial begin
    rst = 1;
    #100;
    rst = 0;
    end

endmodule


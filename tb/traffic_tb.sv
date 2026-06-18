`timescale 1ns/1ps

module traffic_tb;

    logic clk;
    logic rst;

    logic ped_button;
    logic emergency;

    logic NS_G;
    logic NS_Y;
    logic NS_R;

    logic EW_G;
    logic EW_Y;
    logic EW_R;

    //------------------------------------
    // DUT Instantiation
    //------------------------------------

    traffic_fsm DUT
    (
        .clk(clk),
        .rst(rst),

        .ped_button(ped_button),
        .emergency(emergency),

        .NS_G(NS_G),
        .NS_Y(NS_Y),
        .NS_R(NS_R),

        .EW_G(EW_G),
        .EW_Y(EW_Y),
        .EW_R(EW_R)
    );

    //------------------------------------
    // VCD Waveform Dump
    //------------------------------------

    initial begin
        $dumpfile("traffic.vcd");
        $dumpvars(1, DUT);
    end

    //------------------------------------
    // Clock Generation
    //------------------------------------

    always #5 clk = ~clk;

    //------------------------------------
    // Monitor Outputs
    //------------------------------------

    always @(posedge clk)
    begin

        $display(
            "Time=%0t | NS_G=%0b NS_Y=%0b NS_R=%0b | EW_G=%0b EW_Y=%0b EW_R=%0b",
            $time,
            NS_G,
            NS_Y,
            NS_R,
            EW_G,
            EW_Y,
            EW_R
        );

    end

    //------------------------------------
    // Simulation Sequence
    //------------------------------------

    initial
    begin

        clk = 0;
        rst = 1;

        ped_button = 0;
        emergency = 0;

        $display("=================================");
        $display("Traffic Light Controller Test");
        $display("=================================");

        #20;

        rst = 0;

        $display("Reset Released");

        #100;

        ped_button = 1;

        $display("Pedestrian Button Pressed");

        #20;

        ped_button = 0;

        #80;

        emergency = 1;

        $display("Emergency Vehicle Detected");

        #50;

        emergency = 0;

        $display("Emergency Cleared");

        #500;

        $display("Simulation Finished");

        $finish;

    end

endmodule
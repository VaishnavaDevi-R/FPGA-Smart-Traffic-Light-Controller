module top
(
    input  logic clk,
    input  logic rst,

    output logic NS_G,
    output logic NS_Y,
    output logic NS_R,

    output logic EW_G,
    output logic EW_Y,
    output logic EW_R
);

traffic_fsm u_fsm
(
    .clk(clk),
    .rst(rst),

    .NS_G(NS_G),
    .NS_Y(NS_Y),
    .NS_R(NS_R),

    .EW_G(EW_G),
    .EW_Y(EW_Y),
    .EW_R(EW_R)
);

endmodule
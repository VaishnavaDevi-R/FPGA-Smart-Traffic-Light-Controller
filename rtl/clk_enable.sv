module clk_enable
#(
    parameter CLK_FREQ = 50000000,
    parameter TICK_HZ  = 1
)
(
    input logic clk,
    input logic rst,

    output logic tick
);

localparam DIV = CLK_FREQ / TICK_HZ;

logic [$clog2(DIV)-1:0] counter;

always_ff @(posedge clk)
begin
    if(rst)
    begin
        counter <= 0;
        tick <= 0;
    end
    else
    begin
        if(counter == DIV-1)
        begin
            counter <= 0;
            tick <= 1;
        end
        else
        begin
            counter <= counter + 1;
            tick <= 0;
        end
    end
end

endmodule
module timer
(
    input  logic clk,
    input  logic rst,

    input  logic tick,

    input  logic start,

    input  logic [15:0] load_value,

    output logic done
);

logic [15:0] count;

always_ff @(posedge clk)
begin
    if(rst)
    begin
        count <= 0;
        done  <= 0;
    end
    else
    begin

        if(start)
        begin
            count <= load_value;
            done  <= 0;
        end

        else if(tick)
        begin

            if(count > 0)
                count <= count - 1;

            else
                done <= 1;

        end

    end
end

endmodule
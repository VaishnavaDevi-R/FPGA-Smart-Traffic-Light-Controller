module traffic_fsm
(
    input  logic clk,
    input  logic rst,

    input logic ped_button,

    output logic NS_G,
    output logic NS_Y,
    output logic NS_R,

    output logic EW_G,
    output logic EW_Y,
    output logic EW_R
);

typedef enum logic [2:0]
{
    NS_GREEN,
    NS_YELLOW,

    ALL_RED_1,

    PED_WALK,

    EW_GREEN,
    EW_YELLOW,

    ALL_RED_2

} state_t;

state_t current_state;
state_t next_state;

logic [7:0] timer_count;

//
// State Register
//
always_ff @(posedge clk)
begin

    if(rst)
    begin
        current_state <= NS_GREEN;
        timer_count   <= 0;
    end

    else
    begin

        if(current_state != next_state)
        begin
            current_state <= next_state;
            timer_count   <= 0;
        end
        else
        begin
            timer_count <= timer_count + 1;
        end

    end

end

//
// Next State Logic
//
always_comb
begin

    case(current_state)

        NS_GREEN:
        begin
            if(timer_count >= 10)
                next_state = NS_YELLOW;
            else
                next_state = NS_GREEN;
        end

        NS_YELLOW:
        begin
            if(timer_count >= 3)
                next_state = ALL_RED_1;
            else
                next_state = NS_YELLOW;
        end

       ALL_RED_1:
        begin
            if(timer_count >= 2)
            begin
                if(ped_button)
                    next_state = PED_WALK;
                else
                    next_state = EW_GREEN;
            end
            else
                next_state = ALL_RED_1;
        end

        PED_WALK:
        begin
            if(timer_count >= 5)
                next_state = EW_GREEN;
            else
                next_state = PED_WALK;
        end

        EW_GREEN:
        begin
            if(timer_count >= 10)
                next_state = EW_YELLOW;
            else
                next_state = EW_GREEN;
        end

        EW_YELLOW:
        begin
            if(timer_count >= 3)
                next_state = ALL_RED_2;
            else
                next_state = EW_YELLOW;
        end

        ALL_RED_2:
        begin
            if(timer_count >= 2)
                next_state = NS_GREEN;
            else
                next_state = ALL_RED_2;
        end

        default:
            next_state = NS_GREEN;

    endcase

end

//
// Output Logic
//
always_comb
begin

    NS_G = 0;
    NS_Y = 0;
    NS_R = 0;

    EW_G = 0;
    EW_Y = 0;
    EW_R = 0;

    case(current_state)

        NS_GREEN:
        begin
            NS_G = 1;
            EW_R = 1;
        end

        NS_YELLOW:
        begin
            NS_Y = 1;
            EW_R = 1;
        end

        ALL_RED_1:
        begin
            NS_R = 1;
            EW_R = 1;
        end

        PED_WALK:
        begin
            NS_R = 1;
            EW_R = 1;
        end

        EW_GREEN:
        begin
            EW_G = 1;
            NS_R = 1;
        end

        EW_YELLOW:
        begin
            EW_Y = 1;
            NS_R = 1;
        end

        ALL_RED_2:
        begin
            NS_R = 1;
            EW_R = 1;
        end

    endcase

end

endmodule
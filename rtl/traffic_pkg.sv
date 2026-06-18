package traffic_pkg;

    //--------------------------------------------------
    // FSM STATES
    //--------------------------------------------------

    typedef enum logic [3:0]
    {
        NS_GREEN       = 4'd0,
        NS_YELLOW      = 4'd1,
        ALL_RED_1      = 4'd2,

        EW_GREEN       = 4'd3,
        EW_YELLOW      = 4'd4,
        ALL_RED_2      = 4'd5,

        PED_WALK       = 4'd6,
        PED_CLEAR      = 4'd7,

        EMERG_ALL_RED  = 4'd8,

        NIGHT_FLASH    = 4'd9

    } state_t;

    //--------------------------------------------------
    // TIMING PARAMETERS (SECONDS)
    //--------------------------------------------------

    parameter int GREEN_TIME       = 12;

    parameter int YELLOW_TIME      = 3;

    parameter int ALL_RED_TIME     = 1;

    parameter int WALK_TIME        = 8;

    parameter int EXTEND_TIME      = 8;

    parameter int FLASH_PERIOD     = 1;

    //--------------------------------------------------
    // ADAPTIVE TIMING LIMIT
    //--------------------------------------------------

    parameter int MAX_GREEN_TIME =
                    GREEN_TIME +
                    EXTEND_TIME;

endpackage
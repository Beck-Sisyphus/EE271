library verilog;
use verilog.vl_types.all;
entity playGame is
    generic(
        slowClock       : integer := 15
    );
    port(
        CLOCK_50        : in     vl_logic;
        reset           : in     vl_logic;
        SW              : in     vl_logic_vector(8 downto 0);
        redArray        : out    vl_logic_vector(7 downto 0);
        greenArray      : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of slowClock : constant is 1;
end playGame;

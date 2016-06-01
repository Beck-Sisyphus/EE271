library verilog;
use verilog.vl_types.all;
entity changeOneColor is
    port(
        CLOCK_50        : in     vl_logic;
        \array\         : in     vl_logic_vector(7 downto 0);
        nextState       : out    vl_logic_vector(7 downto 0)
    );
end changeOneColor;

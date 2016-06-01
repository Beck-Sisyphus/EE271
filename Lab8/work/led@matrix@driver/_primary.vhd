library verilog;
use verilog.vl_types.all;
entity ledMatrixDriver is
    port(
        CLOCK_50        : in     vl_logic;
        reset           : in     vl_logic;
        redArray        : in     vl_logic_vector(7 downto 0);
        greenArray      : in     vl_logic_vector(7 downto 0);
        redDriver       : out    vl_logic_vector(7 downto 0);
        greenDriver     : out    vl_logic_vector(7 downto 0);
        rowSink         : out    vl_logic_vector(7 downto 0)
    );
end ledMatrixDriver;

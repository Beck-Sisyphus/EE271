library verilog;
use verilog.vl_types.all;
entity gameRule is
    generic(
        \on\            : vl_logic := Hi1;
        off             : vl_logic := Hi0
    );
    port(
        CLOCK_50        : in     vl_logic;
        cells           : in     vl_logic_vector(8 downto 0);
        \out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \on\ : constant is 1;
    attribute mti_svvh_generic_type of off : constant is 1;
end gameRule;

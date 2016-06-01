library verilog;
use verilog.vl_types.all;
entity victory is
    generic(
        off             : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        one             : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        two             : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        leftest         : in     vl_logic;
        L               : in     vl_logic;
        rightest        : in     vl_logic;
        R               : in     vl_logic;
        display         : out    vl_logic_vector(6 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of off : constant is 1;
    attribute mti_svvh_generic_type of one : constant is 1;
    attribute mti_svvh_generic_type of two : constant is 1;
end victory;

library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        Neg             : out    vl_logic;
        Clock           : in     vl_logic;
        Reset_A         : in     vl_logic;
        Reset_B         : in     vl_logic;
        Enable_decoder  : in     vl_logic;
        Data_in         : in     vl_logic;
        Reset_FSM       : in     vl_logic;
        A               : out    vl_logic_vector(7 downto 0);
        B               : out    vl_logic_vector(7 downto 0);
        first           : out    vl_logic_vector(0 to 6);
        last            : out    vl_logic_vector(0 to 6);
        opcode          : out    vl_logic_vector(15 downto 0);
        Result          : out    vl_logic_vector(7 downto 0);
        sign            : out    vl_logic_vector(0 to 6);
        student_id      : out    vl_logic_vector(0 to 6)
    );
end CPU;

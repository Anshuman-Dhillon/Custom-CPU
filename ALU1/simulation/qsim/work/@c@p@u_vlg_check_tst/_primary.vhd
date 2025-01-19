library verilog;
use verilog.vl_types.all;
entity CPU_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        first           : in     vl_logic_vector(0 to 6);
        last            : in     vl_logic_vector(0 to 6);
        Neg             : in     vl_logic;
        opcode          : in     vl_logic_vector(15 downto 0);
        Result          : in     vl_logic_vector(7 downto 0);
        sign            : in     vl_logic_vector(0 to 6);
        student_id      : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end CPU_vlg_check_tst;

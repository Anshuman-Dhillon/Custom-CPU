library verilog;
use verilog.vl_types.all;
entity CPU_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        Data_in         : in     vl_logic;
        Enable_decoder  : in     vl_logic;
        Reset_A         : in     vl_logic;
        Reset_B         : in     vl_logic;
        Reset_FSM       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CPU_vlg_sample_tst;

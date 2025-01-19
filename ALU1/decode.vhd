LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decode IS
    PORT (
        w  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4-bit input
        en : IN STD_LOGIC;                     -- Enable signal
        y  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- 16-bit output
    );
END decode;

ARCHITECTURE Behavior OF decode IS
    SIGNAL Enw : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
    Enw <= en & w;  -- Concatenate enable and input
	 
    WITH Enw SELECT
        y <= "0000000000000001" WHEN "10000", -- Corresponds to y(0)
             "0000000000000010" WHEN "10001", -- Corresponds to y(1)
             "0000000000000100" WHEN "10010", -- Corresponds to y(2)
             "0000000000001000" WHEN "10011", -- Corresponds to y(3)
             "0000000000010000" WHEN "10100", -- Corresponds to y(4)
             "0000000000100000" WHEN "10101", -- Corresponds to y(5)
             "0000000001000000" WHEN "10110", -- Corresponds to y(6)
             "0000000010000000" WHEN "10111", -- Corresponds to y(7) -- Stops here and goes back to y(0), since current state is only until s7
             "0000000100000000" WHEN "11000", -- Corresponds to y(8)
             "0000001000000000" WHEN "11001", -- Corresponds to y(9)
             "0000010000000000" WHEN "11010", -- Corresponds to y(10)
             "0000100000000000" WHEN "11011", -- Corresponds to y(11)
             "0001000000000000" WHEN "11100", -- Corresponds to y(12)
             "0010000000000000" WHEN "11101", -- Corresponds to y(13)
             "0100000000000000" WHEN "11110", -- Corresponds to y(14)
             "1000000000000000" WHEN "11111", -- Corresponds to y(15)
             "0000000000000000" WHEN OTHERS;  -- Default case
END Behavior;

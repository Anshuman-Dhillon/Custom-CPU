LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sseg_modified IS
    PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            leds : OUT STD_LOGIC_VECTOR(0 TO 6)) ;
END sseg_modified;

ARCHITECTURE Behavior OF sseg_modified IS
BEGIN
    PROCESS ( bcd )
    BEGIN
        CASE bcd IS              -- abcdefg
            WHEN "0000" => leds <= "1101000"; --n
            WHEN "0001" => leds <= "1000100"; --y
            WHEN OTHERS => leds <= "-------";
        END CASE;
    END PROCESS;
END Behavior;
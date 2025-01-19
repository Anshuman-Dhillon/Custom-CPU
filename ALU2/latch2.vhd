LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity latch2 IS
	port ( 
			 reset, clk : in std_logic ;
			 Q : out std_logic_vector(7 downto 0)) ; -- 8-bit output
end latch2;

architecture behavior of latch2 is
begin
	process (reset, clk)
	begin
		if reset = '0' then
			Q <= "00000000" ;
		elsif (clk'EVENT AND clk = '1') then
			Q <= "10010111" ; --B is 97
		end if ;
	end process ;
end behavior ;
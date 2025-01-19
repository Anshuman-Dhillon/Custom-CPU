LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity latch1 IS
	port ( 
			 reset, clk : in std_logic ;
			 Q : out std_logic_vector(7 downto 0)) ; -- 8-bit output
end latch1;

architecture behavior of latch1 is
begin
	process (reset, clk)
	begin
		if reset = '0' then
			Q <= "00000000" ;
		elsif (clk'EVENT AND clk = '1') then
			Q <= "01011001" ; --A is 59
		end if ;
	end process ;
end behavior ;
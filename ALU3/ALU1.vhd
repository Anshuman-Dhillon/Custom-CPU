LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ALU1 is -- ALU unit includes Reg. 3
	port ( 
		clk 			: in std_logic;
		A, B 			: in unsigned(7 downto 0); -- 8-bit inputs A & B from the latches
		opcode 		: in unsigned(15 downto 0); -- 16-bit opcode from Decoder
		student_id 	: in std_logic_vector(3 downto 0); -- 4-bit input of student_id from FSM
		res 			: out std_logic_vector(3 downto 0) -- 4-bit Result (parity for student_id)
	);
end ALU1;

architecture calculation of ALU1 is
	signal student_parity : std_logic_vector(3 downto 0);  -- Signal to hold parity result
begin
	process (clk)
		variable count_ones : integer := 0; -- Local variable to count '1's
	begin
		if rising_edge(clk) then
			count_ones := 0; -- Reset counter
			
			-- Count the number of '1's in student_id
			for i in 0 to student_id'length - 1 loop
				if student_id(i) = '1' then
					count_ones := count_ones + 1;
				end if;
			end loop;
			
			-- Determine parity
			if (count_ones mod 2 = 0) then
				student_parity <= "0000"; -- Even parity
			else
				student_parity <= "0001"; -- Odd parity
			end if;
		end if;
	end process;
	
	res <= student_parity; -- Output the parity result
end calculation;
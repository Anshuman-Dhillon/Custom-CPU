LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU1 is -- ALU unit includes Reg. 3
	port ( clk 			: in std_logic ;
			 A, B 		: in unsigned(7 downto 0); -- 8-bit inputs A & B from the latches
			 opcode 		: in unsigned(15 downto 0); -- 16-bit opcode from Decoder
			 res 			: out unsigned(7 downto 0);
			 Neg 			: out std_logic;
			 R1, R2 		: out unsigned(3 downto 0)); -- Split result outputs
end ALU1 ;

architecture calculation of ALU1 is
	signal Reg1, Reg2, result, temp : unsigned(7 downto 0);
	signal negative : std_logic;
begin
	
	process ( clk, opcode )
	begin
		
		if (rising_edge(clk)) then
			Reg1 <= A;
			Reg2 <= B;
			
			case opcode is
					 WHEN "0000000000000001" => -- Subtraction for Reg1 and Reg2
                    result <= NOT(Reg1 - Reg2) + 1;
						  negative <= '1';
                WHEN "0000000000000010" => -- 2s Complement for Reg2
                    result <= NOT(Reg2) + 1;
						  negative <= '0';
                WHEN "0000000000000100" => -- Swap the lower 4 bits of A with lower 4 bits of B
						  result <= Reg1(7 downto 4) & Reg2(3 downto 0);
						  negative <= '0';
                WHEN "0000000000001000" => -- Produce null in output
                    result <= "00000000";
						  negative <= '0';
                WHEN "0000000000010000" => -- Decrement Reg2 by 5
                    result <= Reg2 - "00000101";
						  negative <= '0';
                WHEN "0000000000100000" => -- Invert the bit-significance order of Reg1
                    result <= Reg1(0) & Reg1(1) & Reg1(2) & Reg1(3) & Reg1(4) & Reg1(5) & Reg1(6) & Reg1(7);
						  negative <= '0';
                WHEN "0000000001000000" => -- Shift Reg2 to left by 3 bits, input bit = 1 (SHL)
                    result <= Reg2(4 downto 0) & "111";
						  negative <= '0';
                WHEN "0000000010000000" => -- Increment Reg1 by 3
                    result <= Reg1 + "00000011";
						  negative <= '0';
                WHEN OTHERS => 				 --Don't care, do nothing
						  result <= "00000000";
				end case;
		end if ;
	end process ;
	
	--Set internal signals to the actual outputs (for testing)
	res <= result;
	neg <= negative;
	
	-- Split the 8-bit result into R1 (lower 4 bits) and R2 (upper 4 bits)
   R1 <= result(3 downto 0);
   R2 <= result(7 downto 4);
end calculation ;
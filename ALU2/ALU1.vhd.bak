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
	signal Reg1, Reg2, result : unsigned(7 downto 0);
	signal negative : std_logic;
begin
	
	Reg1 <= A;
	Reg2 <= B;
	
	process ( clk, opcode )
	begin
		
		if (rising_edge(clk)) then
			case opcode is
					 WHEN "0000000000000001" => -- Addition for Reg1 and Reg2
                    result <= Reg1 + Reg2;
						  negative <= '0';
                WHEN "0000000000000010" => -- Subtraction for Reg1 and Reg2
                    result <= NOT(Reg1 - Reg2) + 1;
						  negative <= '1';
                WHEN "0000000000000100" => -- Inverse of Reg1
                    result <= NOT Reg1;
						  negative <= '0';
                WHEN "0000000000001000" => -- NAND of Reg1 and Reg2
                    result <= Reg1 NAND Reg2;
						  negative <= '0';
                WHEN "0000000000010000" => -- NOR of Reg1 and Reg2
                    result <= Reg1 NOR Reg2;
						  negative <= '0';
                WHEN "0000000000100000" => -- AND of Reg1 and Reg2
                    result <= Reg1 AND Reg2;
						  negative <= '0';
                WHEN "0000000001000000" => -- XOR of Reg1 and Reg2
                    result <= Reg1 XOR Reg2;
						  negative <= '0';
                WHEN "0000000010000000" => -- OR of Reg1 and Reg2
                    result <= Reg1 OR Reg2;
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
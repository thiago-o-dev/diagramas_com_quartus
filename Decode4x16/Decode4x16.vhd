library ieee;
USE ieee.std_logic_1164.all;

ENTITY Decode4x16 IS
	PORT (
		din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		dout : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END Decode4x16;
	
ARCHITECTURE arch_decode4x16 OF Decode4x16 is 
BEGIN
	PROCESS(din)
	BEGIN
		CASE din IS					-- abcdefg	
			WHEN "0000" => dout <= "0000001"; --0
			WHEN "0001" => dout <= "1001111"; --1
			WHEN "0010" => dout <= "0010010"; --2
			WHEN "0011" => dout <= "0000110"; --3  
			WHEN "0100" => dout <= "1001100"; --4
			WHEN "0101" => dout <= "0100100"; --5
			WHEN "0110" => dout <= "0100000"; --6
			WHEN "0111" => dout <= "0001111"; --7
			WHEN "1000" => dout <= "0000000"; --8
			WHEN "1001" => dout <= "0001100"; --9
			WHEN "1010" => dout <= "0001000"; --A
			WHEN "1011" => dout <= "1100000"; --B
			WHEN "1100" => dout <= "0110001"; --C
			WHEN "1101" => dout <= "1000010"; --D
			WHEN "1110" => dout <= "0110000"; --E
			WHEN "1111" => dout <= "0111000"; --F
		END CASE;
	END PROCESS;
END arch_decode4x16;
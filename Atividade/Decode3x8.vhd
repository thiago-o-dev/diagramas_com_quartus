library ieee;
USE ieee.std_logic_1164.all;

ENTITY Decode3x8 IS
	PORT (
		din : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Decode3x8;
	
ARCHITECTURE arch_Decode3x8 OF Decode3x8 is 
BEGIN
	PROCESS(din)
	BEGIN
		CASE din IS					-- abcdefg	
			WHEN "000" => dout <= "00000001"; --0
			WHEN "001" => dout <= "11001111"; --1
			WHEN "010" => dout <= "00010010"; --2
			WHEN "011" => dout <= "00000110"; --3  
			WHEN "100" => dout <= "11001100"; --4
			WHEN "101" => dout <= "00100100"; --5
			WHEN "110" => dout <= "00100000"; --6
			WHEN "111" => dout <= "00001111"; --7
		END CASE;
	END PROCESS;
END arch_Decode3x8;

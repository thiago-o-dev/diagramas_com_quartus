library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Calc4bits IS
	PORT (
		din1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		din2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		
		dout_din1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		dout_din2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		dout_result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END Calc4bits;


ARCHITECTURE arch_Calc4bits OF Calc4bits IS

	signal sum_result : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	--signal sum_1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	--signal sum_2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	Component Decode4x16 IS
	port ( 
		din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
	END component;

BEGIN
	sum_result <= std_logic_vector(unsigned(din1) + unsigned(din2));
--	or1 : porta_or port map(
--		E1 => ENTRADA(0),
--		E2 => ENTRADA(1),
--		S => t1
--	);
		u1 : Decode4x16 port map(
				din => din1,
				dout => dout_din1
			);
		
		u2 : Decode4x16 port map(
				din => din2,
				dout => dout_din2
			);
		
		u3 : Decode4x16 port map(
				din => sum_result,
				dout => dout_result(3 DOWNTO 0)
			);
		u4 : Decode4x16 port map(
				din => sum_result,
				dout => dout_result(7 DOWNTO 4)
			);
		
END arch_Calc4bits;
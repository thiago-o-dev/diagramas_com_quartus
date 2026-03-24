library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Calc4bits IS
	PORT (
		din1, din2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		
		sum_or_sub : in STD_LOGIC;
		
		dout_din1, dout_din2, dout_result1,dout_result2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END Calc4bits;


ARCHITECTURE arch_Calc4bits OF Calc4bits IS

	signal chosen_result : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	Component Decode4x16 IS
	port ( 
		din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
	END component;
	
	COMPONENT mux16x8 IS 
	port (
		E1, E2: STD_LOGIC_VECTOR(7 DOWNTO 0);
		SEL: in std_logic;
		s: out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END component;

BEGIN
		u1 : Decode4x16 port map(
				din => din1,
				dout => dout_din1
			);
		
		u2 : Decode4x16 port map(
				din => din2,
				dout => dout_din2
			);
			
		u3 : mux16x8 port map(
				E1 => std_logic_vector(resize(unsigned(din1), 8) + resize(unsigned(din2), 8)),
				E2 => std_logic_vector(resize(unsigned(din1), 8) - resize(unsigned(din2), 8)),
				SEL => sum_or_sub,
				S => chosen_result
			);
		
		u4 : Decode4x16 port map(
				din => chosen_result(3 DOWNTO 0),
				dout => dout_result1
			);
		
		u5 : Decode4x16 port map(
				din => chosen_result(7 DOWNTO 4),
				dout => dout_result2
			);
		
END arch_Calc4bits;
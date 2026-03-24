LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY mux16x8 IS 
port (
	E1, E2: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEL: in std_logic;
	s: out STD_LOGIC_VECTOR(7 DOWNTO 0)
);

END ENTITY mux16x8;
architecture arch_mux of mux16x8 is 
begin 
	process (E1, E2, SEL)
	begin
		if SEL = '0'
			then s <= E1;
			else s <= E2;
		end if;
	end process;

END arch_mux;

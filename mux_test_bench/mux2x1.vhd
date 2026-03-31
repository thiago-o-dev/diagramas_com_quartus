LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2x1 IS
	port (
		E1,E2,SEL: in std_logic;
		S: out std_logic 
	);
END ENTITY mux2x1;

architecture arch_mux of mux2x1 is
begin
	process(E1,E2,SEL)
		begin
		if sel ='0' then
			S <= E1;
		else
			S <= E2;
		end if;
	end process;
end arch_mux;
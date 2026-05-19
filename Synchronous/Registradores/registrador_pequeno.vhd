LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registrador_pequeno IS
	port ( 
		clk: in std_logic;
		din: in std_logic_vector(1 downto 0);
		dout: out std_logic_vector(1 downto 0)
	);
END registrador_pequeno;

architecture arch_registrador_pequeno of registrador_pequeno is
	signal registro:std_logic_vector(1 downto 0);
	
	begin
	
	process(clk)
		begin
		if clk'event and clk='1' then
		registro <= din;
		end if;
	end process;
	
	dout <= registro;
end arch_registrador_pequeno;
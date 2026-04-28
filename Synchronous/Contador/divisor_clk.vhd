LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity divisor_clk is
	port (
		clk : in std_logic;
		S : out std_logic
	);
end divisor_clk;

architecture arch_divisor_clk of divisor_clk is
	signal count : integer range 0 to 50000000 := 0;
	
	begin
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			if count <= 25000000 then
				S <= '1';
			else
				S <= '0';
			end if;
			count <= count + 1;
		end if;
	end process;
end arch_divisor_clk;
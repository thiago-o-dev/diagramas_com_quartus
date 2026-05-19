LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity divisor_clk is
	generic (
        MAX_COUNT : integer := 50000000 -- Default
    );
	port (
		clk : in std_logic;
		S : out std_logic
	);
end divisor_clk;

architecture arch_divisor_clk of divisor_clk is
	signal count : integer range 0 to MAX_COUNT := 0;
	begin
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			-- incrementa
			if count >= (MAX_COUNT - 1) then
				 count <= 0;
			else
				 count <= count + 1;
			end if;
			
			-- Define valor
			if count <= (MAX_COUNT / 2) then
				S <= '1';
			else
				S <= '0';
			end if;
		end if;
	end process;
end arch_divisor_clk;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity contador_binario IS
	port (
		clk : in std_logic;
		saida : out std_logic_vector(3 downto 0)
	);
end contador_binario;

architecture arch_contador_binario of contador_binario is
	signal binario : std_logic_vector(3 downto 0) := "0000";
	begin
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			binario <= binario + 1;
		end if;
	end process;
	
	saida <= binario;
end arch_contador_binario;
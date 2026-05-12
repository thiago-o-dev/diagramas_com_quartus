LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity contador_binario_complexo IS
	port (
		clk : in std_logic;
		max_inclusive : in std_logic_vector(3 downto 0);
		clk_out : out std_logic;
		saida : out std_logic_vector(3 downto 0)
	);
end contador_binario_complexo;

architecture arch_contador_binario_complexo of contador_binario_complexo is
	signal binario : std_logic_vector(3 downto 0) := "0000";
	signal max_flagged: std_logic := '0';
	begin
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			binario <= binario + 1;
			max_flagged <= '0';
			
			if binario >= max_inclusive then
				binario <= "0000";
				max_flagged <= '1';
			end if;
		end if;
	end process;
	
	saida <= binario;
	clk_out <= max_flagged;
end arch_contador_binario_complexo;
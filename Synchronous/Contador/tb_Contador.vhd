LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_Contador is
END tb_Contador;

ARCHITECTURE tb_Contador_arch OF tb_Contador is
	component contador IS
		port (
			MAX10_CLK1_50 : in std_logic;
			LEDR : out std_logic_vector(9 downto 0)
		);
	end component;
	
	signal MAX10_CLK1_50 : std_logic := '0';
	signal LEDR : std_logic_vector(9 downto 0);
	
	begin
	
	dut: contador
	port map (
		MAX10_CLK1_50 => MAX10_CLK1_50,
		LEDR => LEDR
	);
	
	process
	begin
		MAX10_CLK1_50 <= '0';
		wait for 10 ns;
		MAX10_CLK1_50 <= '1';
		wait for 10 ns;
	end process;
end tb_Contador_arch;
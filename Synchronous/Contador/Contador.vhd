LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY contador IS
	port (
		MAX10_CLK1_50 : in std_logic;
		LEDR : out std_logic_vector(9 downto 0);
		HEX0 : out std_logic_vector(7 downto 0)
	);
end contador;

architecture arch_contador of contador is
	signal S : std_logic;
	signal binario : std_logic_vector(3 downto 0);
	
	component divisor_clk
	port (
	clk : in std_logic;
	S : out std_logic
	);
	end component;
	
	component contador_binario
		port (
			clk : in std_logic;
			saida : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component dec_hex
		port (
			entrada : in std_logic_vector(3 downto 0);
			HEX0 : out std_logic_vector(7 downto 0)
		);
	end component;

	begin
	
	comp_divisor: divisor_clk
		port map (
			clk => MAX10_CLK1_50,
			S => S
		);
			
	comp_contador: contador_binario
		port map (
			clk => S,
			saida => binario
		);
		
	comp_dec_hex: dec_hex
		port map (
			entrada => binario,
			HEX0 => HEX0
		);
	
	LEDR(3 downto 0) <= binario;
	LEDR(8 downto 4) <= "00000";
	LEDR(9) <= S;
end arch_contador;
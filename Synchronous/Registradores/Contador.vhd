LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY contador IS
	port (
		MAX10_CLK1_50 : in std_logic;
		LEDR : out std_logic_vector(9 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX5 : out std_logic_vector(7 downto 0)
	);

end contador;

architecture arch_contador of contador is
	signal S : std_logic;
	signal binario : std_logic_vector(3 downto 0);
	
	signal rel1, rel2, rel3, rel4 : std_logic_vector(3 downto 0);
	signal clk_relogios : std_logic_vector(3 downto 0);
	
	signal nine : std_logic_vector(3 downto 0) := "1001";
	signal five : std_logic_vector(3 downto 0) := "0101";
	
	component divisor_clk
		generic (
			  MAX_COUNT : integer := 50000000
		 );
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
	
	component contador_binario_complexo
		port (
			clk : in std_logic;
			max_inclusive : in std_logic_vector(3 downto 0);
			clk_out : out std_logic;
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
--		generic map(
--			MAX_COUNT => 5000
--		)
		port map (
			clk => MAX10_CLK1_50,
			S => S
		);
		
	-- Binario de segundos 0 a F
	comp_contador: contador_binario
		port map (
			clk => S,
			saida => binario
		);
	
	-- Relogio
	contador_segundos_un : contador_binario_complexo
		port map (
			clk => S,
			max_inclusive => nine,
			clk_out => clk_relogios(0),
			saida => rel1
		);
	
	contador_segundos_dec : contador_binario_complexo
		port map (
			clk => clk_relogios(0),
			max_inclusive => five,
			clk_out => clk_relogios(1),
			saida => rel2
		);
	
	contador_minutos_un : contador_binario_complexo
		port map (
			clk => clk_relogios(1),
			max_inclusive => nine,
			clk_out => clk_relogios(2),
			saida => rel3
		);
	
	contador_minutos_dec : contador_binario_complexo
		port map (
			clk => clk_relogios(2),
			max_inclusive => five,
			clk_out => clk_relogios(3),
			saida => rel4
		);
	
	--	Renderizamos os binarios
	comp_dec_hex0: dec_hex
		port map (
			entrada => rel1,
			HEX0 => HEX0
		);
	comp_dec_hex1: dec_hex
		port map (
			entrada => rel2,
			HEX0 => HEX1
		);
	comp_dec_hex2: dec_hex
		port map (
			entrada => rel3,
			HEX0 => HEX2
		);
	comp_dec_hex3: dec_hex
		port map (
			entrada => rel4,
			HEX0 => HEX3
		);
	
	comp_dec_hex4: dec_hex
		port map (
			entrada => binario,
			HEX0 => HEX5
		);
	
	LEDR(3 downto 0) <= binario;
	LEDR(8 downto 4) <= "00000";
	LEDR(9) <= S;
end arch_contador;
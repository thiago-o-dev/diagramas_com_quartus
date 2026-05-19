LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY registrador_placa IS
	port ( 
		KEY: in std_logic_vector(1 downto 0);
		SW: in std_logic_vector(9 downto 0);
		HEX5: out std_logic_vector(7 downto 0);
		HEX3: out std_logic_vector(7 downto 0);
		--HEX1: out std_logic_vector(7 downto 0);
		HEX0: out std_logic_vector(7 downto 0);
		LEDR: out std_logic_vector(9 downto 0)
	);
END registrador_placa;

architecture arch_registrador_placa of registrador_placa is
	signal saida1, saida2: std_logic_vector(3 downto 0);
	signal saida_operacao: std_logic_vector(1 downto 0);
	signal resultado_operacao : std_logic_vector(3 downto 0);
	
	component registrador IS
		port (
			clk: in std_logic;
			din: in std_logic_vector(3 downto 0);
			dout: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component registrador_pequeno IS
		port (
			clk: in std_logic;
			din: in std_logic_vector(1 downto 0);
			dout: out std_logic_vector(1 downto 0)
		);
	end component;
	
	COMPONENT dec_hex2 is
		port (
			entrada : in std_logic_vector(3 downto 0);
			saida : out std_logic_vector(7 downto 0)
		);
	end COMponent;
	
	begin
	
	reg1 : registrador port map(
		clk => KEY(0),
		din => SW(3 downto 0),
		dout => saida1
	);
	dec1 : dec_hex2 port map(
		entrada => saida1,
		saida => HEX3
	);
	reg2 : registrador port map(
		clk => KEY(1),
		din => SW(9 downto 6),
		dout => saida2
	);
	dec2 : dec_hex2 port map(
		entrada => saida2,
		saida => HEX5
	);
	
	reg3 : registrador_pequeno port map(
		clk => KEY(1),
		din => SW(5 downto 4),
		dout => saida_operacao
	);
	
	dec3 : dec_hex2 port map(
		entrada => resultado_operacao,
		saida => HEX0
	);
	
	LEDR(3 downto 0) <= saida1;
	LEDR(5 downto 4) <= saida_operacao;
	LEDR(9 downto 6) <= saida2;
	
	process(saida_operacao)
	begin
		case saida_operacao is
			when "00" => resultado_operacao <= saida2 + saida1; -- soma
			when "01" => resultado_operacao <= saida2 - saida1; -- subtracao
			when "10" => resultado_operacao <= saida2 + 1; -- incrementa
			when "11" => resultado_operacao <= saida2 - 1; -- decrementa
		end case;
	end process;
end arch_registrador_placa;
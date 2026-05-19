LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tb_registrador is
end tb_registrador;

ARCHITECTURE arch_tb_registrador of
	tb_registrador is
	signal clk : std_logic;
	signal din : std_logic_vector(3 downto
	0);
	signal dout : std_logic_vector(3 downto
	0);
	component registrador IS
	port ( clk: in std_logic;
	din: in std_logic_vector(3 downto 0);
	dout: out std_logic_vector(3 downto
	0));
	end component;
	begin
	reg1: registrador
	port map (
	clk => clk,
	din => din,
	dout => dout
	);
	process
	begin
		clk <= '0';
		din <= "0000";
		wait for 10 ns;
		din <= "1010";
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		din <= "0101";
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		din <= "1111";
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		din <= "0001";
		wait for 5 ns;
		din <= "0010";
		wait for 5 ns;
		din <= "0011";
		wait for 5 ns;
		din <= "0100";
		wait for 5 ns;
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		din <= "0110";
		wait for 10 ns;
		clk <= '1';
		wait for 1 ps;
		din <= "1001";
		wait for 9 ns;
		clk <= '0';
		wait for 10 ns;
		wait;
	end process;
END arch_tb_registrador;
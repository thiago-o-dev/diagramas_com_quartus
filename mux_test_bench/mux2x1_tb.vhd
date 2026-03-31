LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2x1_tb IS
END  mux2x1_tb;

architecture arch_mux2x1_tb of mux2x1_tb is

component mux2x1 is
port (
		E1,E2,SEL: in std_logic;
		S: out std_logic 
	);
end component;

signal e1_tb, e2_tb, sel_tb, s_tb : std_logic;
begin
	dut : mux2x1 port map (E1 => e1_tb, E2 => e2_tb, SEL => sel_tb, S => s_tb); 
	stim: process
	begin
		e1_tb <= '0';
		e2_tb <= '0';
		sel_tb <= '0';
		wait for 10 ns;
		sel_tb <= '1';
		wait for 10 ns;
		e1_tb <= '0';
		e2_tb <= '1';
		sel_tb <= '0';
		wait for 10 ns;
		sel_tb <= '1';
		wait for 10 ns;
		e1_tb <= '1';
		e2_tb <= '0';
		sel_tb <= '0';
		wait for 10 ns;
		sel_tb <= '1';
		wait for 10 ns;
		e1_tb <= '1';
		e2_tb <= '1';
		sel_tb <= '0';
		wait for 10 ns;
		sel_tb <= '1';
		wait;
	end process;
end arch_mux2x1_tb;
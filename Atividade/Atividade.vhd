library ieee;
USE ieee.std_logic_1164.all;

ENTITY Atividade IS
	PORT (
		din : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		Sn : OUT STD_LOGIC
	);
END Atividade;


ARCHITECTURE arch_Atividade OF Atividade IS
	signal dout : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal S_mux1, S_mux2, S_and, S_or : STD_LOGIC;
	
	Component decode3x8 IS
	port ( 
		din : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	); 
	END component;
	
	Component mux2x1 IS
	port ( 
		E1, E2, SEL : IN STD_LOGIC;
		S : OUT STD_LOGIC
	); END component;
	
	Component porta_or IS
	port ( 
		E1, E2 : IN STD_LOGIC;
		S : OUT STD_LOGIC
	); END component;
	
	Component porta_and IS
	port ( 
		E1, E2 : IN STD_LOGIC;
		S : OUT STD_LOGIC
	); END component;

BEGIN
	comp_decode3x8 : decode3x8 port map( din => din(2 downto 0), dout => dout );
	
	comp_mux2x1_1 : mux2x1 port map( E1 => dout(2), E2 => dout(3), SEL => din(3), S => S_mux1 );
	
	comp_mux2x1_2 : mux2x1 port map( E1 => dout(4), E2 => dout(5), SEL => din(4), S => S_mux2 );
	
	comp_porta_and : porta_and port map( E1 => S_mux1, E2 => S_mux2, S => S_and );
	
	comp_porta_or : porta_or port map( E1 => S_and, E2 => din(5), S => S_or );
	
	comp_mux2x1_3 : mux2x1 port map( E1 => S_or, E2 => dout(7), SEL => din(6), S => Sn );
		
END arch_Atividade;
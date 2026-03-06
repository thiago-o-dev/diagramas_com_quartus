LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY porta_or IS
port ( 
	E1,E2: in std_logic;
	S: out std_logic
);
END porta_or;

ARCHITECTURE porta_or_arch OF porta_or IS
BEGIN
	S <= E1 or E2;
END porta_or_arch;
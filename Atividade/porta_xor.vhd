LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY porta_xor IS
port ( 
	E1,E2: in std_logic;
	S: out std_logic
);
END porta_xor;

ARCHITECTURE porta_xor_arch OF porta_xor IS

BEGIN
	S <= E1 xor E2;
END porta_xor_arch;
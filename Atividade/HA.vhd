LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY HA IS
port ( 
	A,B: in std_logic;
	S, C: out std_logic
);
END HA;

ARCHITECTURE HA_arch OF HA IS
BEGIN
	S <= A xor B;
	C <= A and B;
END HA_arch;
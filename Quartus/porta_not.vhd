LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY porta_not IS
port ( E1: in std_logic;
S: out std_logic);
END porta_not;
ARCHITECTURE porta_not_arch OF porta_not IS
BEGIN
S <= not E1;
END porta_not_arch ;
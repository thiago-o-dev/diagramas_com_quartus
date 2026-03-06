LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somador1bit IS
PORT(
	cin,a,b : IN STD_LOGIC;
	s, cout : OUT STD_LOGIC
);
END somador1bit;

ARCHITECTURE somador1bit_arch OF somador1bit IS

BEGIN
	s <= a xor b xor cin;
	cout <= (a and b) or (cin and a) or (cin and b);
END somador1bit_arch ;
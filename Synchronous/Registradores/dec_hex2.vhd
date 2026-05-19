LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY dec_hex2 IS
port (
entrada : in std_logic_vector(3 downto 0);
saida : out std_logic_vector(7 downto 0)
);
end dec_hex2;
architecture arch_dec_hex2 of dec_hex2 is
begin
process(entrada)
begin
case entrada is
when "0000" => saida <= "11000000"; -- 0
when "0001" => saida <= "11111001"; -- 1
when "0010" => saida <= "10100100"; -- 2
when "0011" => saida <= "10110000"; -- 3
when "0100" => saida <= "10011001"; -- 4
when "0101" => saida <= "10010010"; -- 5
when "0110" => saida <= "10000010"; -- 6
when "0111" => saida <= "11111000"; -- 7
when "1000" => saida <= "10000000"; -- 8
when "1001" => saida <= "10010000"; -- 9
when "1010" => saida <= "10001000"; -- A
when "1011" => saida <= "10000011"; -- b
when "1100" => saida <= "11000110"; -- C
when "1101" => saida <= "10100001"; -- d
when "1110" => saida <= "10000110"; -- E
when "1111" => saida <= "10001110"; -- F
when others => saida <= "11111111";
end case;
end process;
end arch_dec_hex2;
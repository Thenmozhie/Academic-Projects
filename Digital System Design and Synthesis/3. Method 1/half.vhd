library ieee;
use ieee.std_logic_1164.all;

entity half_adder1 is
port( A, B : in std_logic;
		  sum, carry : out std_logic);
end half_adder1;
architecture structural of half_adder1 is
component xor1
port(A,B:in std_logic;Z:out std_logic);
end component;
component and1
port(A,B:in std_logic;Z:out std_logic);
end component;
begin
A1:xor1 port map(A,B,sum);
A2:and1 port map(A,B,carry);
end structural;

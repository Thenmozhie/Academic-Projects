library ieee;
use ieee.std_logic_1164.all;

entity full_adder1 is
port( A, B, carry_in : in std_logic;
		  sum, carry_out : out std_logic);
end full_adder1;

architecture structural of full_adder1 is
component half_adder1
port( A, B : in std_logic;
		  sum, carry : out std_logic);
end component;
component or1
port(A,B:in std_logic;Z:out std_logic);
end component;
signal s1,cy1,cy2:std_logic;
begin
HA1:half_adder1 port map(A,B,s1,cy1);
HA2:half_adder1 port map(carry_in,s1,sum,cy2);
A3:or1 port map(cy1,cy2,carry_out);
end structural;

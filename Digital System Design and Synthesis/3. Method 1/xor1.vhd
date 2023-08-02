library ieee;
use ieee.std_logic_1164.all;

entity xor1 is
port(A,B:in std_logic;Z:out std_logic);
end xor1;
architecture data_flow of xor1 is
begin
Z<= ((not A) and B) or (A and (not B));
end data_flow;

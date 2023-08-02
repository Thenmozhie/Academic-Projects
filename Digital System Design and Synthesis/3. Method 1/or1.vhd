library ieee;
use ieee.std_logic_1164.all;

entity or1 is
port(A,B:in std_logic;Z:out std_logic);
end or1;
architecture data_flow of or1 is
begin
Z<= A or B;
end data_flow;

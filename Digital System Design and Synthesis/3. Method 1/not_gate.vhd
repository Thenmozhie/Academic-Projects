library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
port(A: in std_logic; Z: out std_logic);
end not_gate;

architecture data_flow of not_gate is
begin
Z<= not A;
end data_flow;
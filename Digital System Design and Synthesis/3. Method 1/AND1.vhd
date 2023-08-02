-- Description	: The function of this component is to perform AND operation on two binary inputs.

-- Declare library files:
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Entity Declaration:
entity and1 is
port(A,B:in std_logic;Z:out std_logic);
end and1;

-- Architecture Implementation:
architecture data_flow of and1 is
begin
Z<= A and B;
end data_flow;
-- end of and_gate.vhd
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity and_gate is
port(a,b:in std_logic;
  c: out std_logic);
end and_gate;

architecture behaviour of and_gate is 
begin
process(a,b)
begin
  if (a = '1' and b = '1') then
  c <='1';
  else
    c<='0';
   end if; 
   end process;
end behaviour;
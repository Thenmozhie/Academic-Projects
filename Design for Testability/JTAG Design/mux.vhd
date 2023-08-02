library ieee;
use ieee.std_logic_1164.all; 

entity mux is
  port (a, b, s : in std_logic;
     f : out std_logic); 
end mux;

architecture structural of mux is 
begin
  process (a,b,s)
  begin
    if s = '0' then
      f <= a;
    else
      f <= b;
    end if;
  end process;
end structural; 	 	

--Vhdl code for mux in Fetch operation
library ieee;
use ieee.std_logic_1164.all; 

entity mux1 is
  port (
  s : in std_logic;
  a, b : in std_logic_vector(31 downto 0);
	mout : out std_logic_vector(31 downto 0)
	); 
end mux1;

architecture str of mux1 is 
begin
  process (a,b,s)
  begin
    
    if s = '0' then
      mout <= a;
    else
      mout <= b;
    end if;
  
  end process;
end str; 

library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity forwarding_unit_mem_mem is
        port(rt1,rt2:in std_logic_vector(4 downto 0);
             sel1:out std_logic);
               
end forwarding_unit_mem_mem;

architecture behaviour of forwarding_unit_mem_mem is

begin
process(rt1,rt2)
  begin 
    
    if (unsigned(rt1) = unsigned(rt2)) then
      sel1 <= '1';
  else
      sel1 <= '0';
   end if;
              
  end process;
end behaviour; 
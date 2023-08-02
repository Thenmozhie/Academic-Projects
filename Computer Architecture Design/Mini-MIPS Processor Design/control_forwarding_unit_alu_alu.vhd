library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity forwarding_unit_alu_alu is
        port(rs,rt,reg_dst:in std_logic_vector(4 downto 0);
             sel1,sel2:out std_logic);
               
end forwarding_unit_alu_alu;

architecture behaviour of forwarding_unit_alu_alu is

begin
process(rs,rt,reg_dst)
  begin 
    
    if (unsigned(reg_dst) = unsigned(rs)) then
      sel1 <= '1';
  else
      sel1 <= '0';
   end if;
   
    if (unsigned(reg_dst) = unsigned(rt)) then
         sel2 <= '1';
     else
         sel2 <= '0';
      end if;
        
  end process;
end behaviour;    
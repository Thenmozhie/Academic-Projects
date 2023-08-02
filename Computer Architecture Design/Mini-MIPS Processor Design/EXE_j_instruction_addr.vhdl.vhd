library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity j_instruction_addr is
        port(npc:in std_logic_vector(31 downto 0);
            jump:in std_logic_vector(25 downto 0);
               addr:out std_logic_vector(31 downto 0));
end j_instruction_addr;

architecture behaviour of j_instruction_addr is

  
signal upper: std_logic_vector(3 downto 0);
signal tmp: std_logic_vector(31 downto 0);



begin 
  
  
        upper <=npc(31 downto 28);
        tmp<= upper & jump& "00";        
        addr <= std_logic_vector(tmp);

end behaviour;
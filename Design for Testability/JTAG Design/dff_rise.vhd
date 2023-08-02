library ieee;
use ieee. std_logic_1164.all;

entity dff_rise is 
   port(
    d :in  std_logic;    
      clk :in std_logic;   
      q : out std_logic    
   );
end dff_rise;
architecture structural of dff_rise is  
begin  
 process(clk)
 begin 
    if rising_edge(clk) then
   q <= d; 
    end if;       
 end process;  
end structural; 

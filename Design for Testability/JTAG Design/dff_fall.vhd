library ieee;
use ieee. std_logic_1164.all;

entity dff_fall is 
   port(
    d :in  std_logic;    
      clk :in std_logic;   
      q : out std_logic    
   );
end dff_fall;
architecture structural of dff_fall is  
begin  
 process(clk)
 begin 
    if falling_edge(clk) then
   q <= d; 
    end if;       
 end process;  
end structural; 


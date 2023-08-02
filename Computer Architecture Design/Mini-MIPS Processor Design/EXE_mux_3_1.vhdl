library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_3_1 is
        port(a:in std_logic_vector(31 downto 0);
             b:in std_logic_vector(31 downto 0);
            c:in std_logic_vector(31 downto 0);
               s:in std_logic_vector(1 downto 0);
               o:out std_logic_vector(31 downto 0));
end mux_3_1;

architecture behaviour of mux_3_1 is
begin
        process(a,b,c,s)
        begin
        if s="10" then ----J----
                o<= a;
                
      elsif s="01" then  -----JR-----
        o<=b;        
                
        else  -----B 00 11---
                o<= c;
        end if;
        end process;
end behaviour; 
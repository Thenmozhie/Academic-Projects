library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity and_gate_mux is
        port(s:in std_logic_vector(1 downto 0);
             a:in std_logic;
               o:out std_logic);
end and_gate_mux;

architecture behaviour of and_gate_mux is
begin
        process(s,a)
        begin
        if s="10" then ----J----
                o<= '1';
                
      elsif s="01" then  -----JR-----
        o<='1';        
                
        else  -----B 00 11---
                o<= a;
        end if;
        end process;
end behaviour; 
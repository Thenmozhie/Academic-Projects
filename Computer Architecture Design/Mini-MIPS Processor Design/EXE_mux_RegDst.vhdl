library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_RegDst is
        port(a:in std_logic_vector(4 downto 0);
             b:in std_logic_vector(4 downto 0);
               s:in std_logic;
               o:out std_logic_vector(4 downto 0));
end mux_RegDst;

architecture behaviour of mux_RegDst is
begin
        process(a,b,s)
        begin
        if s='0' then
                o<= a;
        else
                o<= b;
        end if;
        end process;
end behaviour; 
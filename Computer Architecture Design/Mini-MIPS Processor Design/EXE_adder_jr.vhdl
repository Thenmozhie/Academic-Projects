library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder_jr is
        port(npc:in std_logic_vector(31 downto 0);
            rs:in std_logic_vector(31 downto 0);
               add_result:out std_logic_vector(31 downto 0));
end adder_jr;

architecture behaviour of adder_jr is
begin
        add_result <= std_logic_vector(rs);
end behaviour;
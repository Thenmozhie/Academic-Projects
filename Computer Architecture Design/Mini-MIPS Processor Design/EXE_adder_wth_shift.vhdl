library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder_wth_shift is
        port(npc:in std_logic_vector(31 downto 0);
            imm:in std_logic_vector(31 downto 0);
               add_result:out std_logic_vector(31 downto 0));
end adder_wth_shift;

architecture behaviour of adder_wth_shift is
begin
        add_result <= std_logic_vector(unsigned(npc)+unsigned(shift_left(unsigned(imm),2)));
end behaviour;
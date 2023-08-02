library ieee;
use ieee. std_logic_1164.all;

entity ir_decode is
  port( cs1,cs2 : in std_logic;
mode, sel : out std_logic);
end ir_decode;

architecture structural of ir_decode is
signal state : std_logic_vector (1 downto 0);
begin

state <= cs1 & cs2;
process (state)
begin
case state is
when "00" => mode <= '1'; sel <= '0';-----extest/update/scan----
when "01" => mode <= '0'; sel <= '1'; ------preload-------
when "10" => mode <= '0'; sel <= '0'; -----sample/normal-------
when "11" => mode <= '1'; sel <= '1';-----bypass--  
  
  
when others => mode <= 'U'; sel <= 'U';

end case;
end process;
 end structural; 

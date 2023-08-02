library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_8_bit is
Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
       clock,clear,load : in STD_LOGIC;
       data_out : out STD_LOGIC_VECTOR (7 downto 0));
end reg_8_bit;


architecture Behavioral of reg_8_bit is
begin
  process (clock) 
  begin
   if clear = '1' then
        data_out <="00000000";
    -- check for positive edge of clock
   elsif clock'event and clock = '1' then
   
      -- if the load signal is low then load the value of input to registers:
      if load ='0' then 
        data_out <=data_in;
      end if;
    end if;
  end process;
end;

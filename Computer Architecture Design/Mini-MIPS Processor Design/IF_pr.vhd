--VHDL code for IF/ID Buffer
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;  

entity IFbuffer is
 port(
  
 clk: in std_logic;
-- enb: in std_logic;
 add_in: in std_logic_vector(31 downto 0);
 add_out: out std_logic_vector(31 downto 0);
 insti: in std_logic_vector(31 downto 0);
 insto: out std_logic_vector(31 downto 0)
);
end IFbuffer;

architecture beh of IFbuffer is
 begin 
  process(clk)
    begin
      if (rising_edge (clk)) then
        insto <= insti;
        add_out <= add_in;
    --else 
    --insto <= "00000000000000000000000000000000";
      end if;
    end process;

end beh;
        
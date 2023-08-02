--VHDL code for adding 4 in Fetch operation
library ieee;
use ieee.std_logic_1164.all; 
use IEEE.numeric_std.all;  

entity add1 is
  port (a: in std_logic_vector(31 downto 0):=(others=>'0');
	addout1 : out std_logic_vector(31 downto 0):=(others=>'0')
	); 
end add1;

architecture beh of add1 is 
begin
	process (a)
	begin
		addout1 <= std_logic_vector(unsigned(a) + 4);
  end process;
end beh;
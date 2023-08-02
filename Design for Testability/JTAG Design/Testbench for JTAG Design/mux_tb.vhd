library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_tb is
end mux_tb;

architecture structural of mux_tb is
    component mux
            port (a, b, s : in std_logic;
				f : out std_logic);
    end component;
	
	signal a, b, s : std_logic :='0';
	signal f : std_logic :='0';
	
	constant clk_period: time :=10ns;
	
begin

muxtb: mux port map (a, b, s, f );

process
begin
a<='1';
b<='0';

s<='0';
wait for 100ns;
s<='1';

b<='1';
wait for 10ns;
b<='0';
wait for 10ns;

b<='1';
wait for 10ns;
b<='0';
wait for 10ns;


b<='1';
wait for 10ns;
b<='0';
wait for 10ns;


b<='1';
wait for 10ns;
b<='0';
wait for 10ns;

s<='1';
wait for 50ns;
a<='0';
wait for 50ns;

end process;














end structural;
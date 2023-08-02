library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture behavior of testbench is
component main3 
port(A,B : in std_logic_vector(7 downto 0);
	clock: in std_logic;
	load: in std_logic;
	clear: in std_logic;
	Z: out std_logic_vector (23 downto 0);
	end_flag: out std_logic);
end component;
signal clock1,clear1,load1: std_logic:= '0';
signal A1,B1: std_logic_vector (7 downto 0);
signal Z1: std_logic_vector (23 downto 0);
begin

tes : main3 port map( 
	A =>A1,
	B =>B1,
	clock=>clock1,
	clear=>clear1,
	load=>load1,
	Z=>Z1);
clock1 <= not(clock1) after 500ns;
load1 <= '0' after 200ns, '1' after 300ns;
A1<="00000010";
B1<="00010000";
clear1 <= '1' after 100ns, '0' after 200ns;

end;

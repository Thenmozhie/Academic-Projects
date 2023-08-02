library IEEE;
use IEEE.STd_LOGIC_1164.ALL;
use IEEE.NUMERIC_STd.ALL;

entity dff_fall_tb is
end dff_fall_tb;

architecture structural of dff_fall_tb is
    component dff_fall
                    port (d :in  std_logic;    
      clk :in std_logic;   
      q : out std_logic );
    end component;
	
	signal d: std_logic :='0';
	signal clk: std_logic :='0';
	signal q : std_logic :='0';
	
	constant clk_period: time :=10ns;

begin

muxfalltb: dff_fall port map( d,clk,q);

clock : process
begin
clk<='0';
wait for clk_period/2;
clk<='1';
wait for clk_period/2;
end process;

simulation: process
begin
d<='0';
wait for clk_period;
d<='0';
wait for clk_period;
d<='0';
wait for clk_period;
d<='0';
wait for clk_period;
d<='0';
wait for clk_period;
d<='1';
wait for clk_period*10;

d<='0';
wait for clk_period*10;

end process;





end structural;
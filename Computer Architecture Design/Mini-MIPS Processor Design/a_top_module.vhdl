library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity tb is 
end tb;


architecture behaviour of tb is
  
  
component MIPS is 
port(clk: in std_logic);
end component;


signal clk:std_logic;
constant clock_period: time:=10 ns;
begin

MIPS_tag: MIPS port map(clk);
  
  process
    begin
      clk<='0';
      wait for clock_period/2;
      clk<='1';
      wait for clock_period/2;
   end process;
end;
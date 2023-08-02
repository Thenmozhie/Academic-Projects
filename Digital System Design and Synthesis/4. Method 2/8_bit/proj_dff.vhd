library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proj_dff is
  generic(
          delay : time := 1 ns); 
  port(
    d    : in  std_logic;
    en   : in  std_logic;
    clk  : in  std_logic;
    q    : out std_logic
    );
  end proj_dff;
  
  architecture proj_dff_arch of proj_dff is 
  begin
     process (clk) is
     begin
        if rising_edge(clk) then
           if (en ='1') then
               q <= d;
              end if;
           end if;
     end process;
  end architecture proj_dff_arch;
    
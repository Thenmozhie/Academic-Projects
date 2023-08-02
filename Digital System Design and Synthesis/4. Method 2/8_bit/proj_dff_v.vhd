library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proj_dff_v is
  generic(width : integer := 1;
          delay : time := 1 ns); 
  port(
    d    : in  std_logic_vector(width-1 downto 0);
    en   : in  std_logic;
    clk  : in  std_logic;
    q    : out std_logic_vector(width-1 downto 0));
  end proj_dff_v;
  
  architecture proj_dff_v_arch of proj_dff_v is 
  begin
     process (clk) is
     begin
        if rising_edge(clk) then
           if (en ='1') then
               q <= d;
              end if;
           end if;
     end process;
  end architecture proj_dff_v_arch;

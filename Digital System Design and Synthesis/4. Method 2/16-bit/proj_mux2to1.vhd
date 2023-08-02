library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proj_mux2to1 is
  generic(width : integer := 8);
  port(
    a   : in  std_logic_vector(width-1 downto 0);
    b   : in  std_logic_vector(width-1 downto 0);
    sel : in  std_logic;
    o   : out std_logic_vector(width-1 downto 0));
  end proj_mux2to1;
  
  architecture mux of proj_mux2to1 is 
  begin 
    process(a,b,sel)
      begin
        if sel='0' then
          o <= a;
        else
          o <= b;
        end if;
      end process;
  end mux;

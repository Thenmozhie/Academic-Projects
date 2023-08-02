library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity proj_edge is
  generic(del   : time := 2 ns;
          pos   : integer := 1);
   port (
      sig      :in std_logic;
      edg      :out std_logic
   );
end proj_edge;

architecture proj_edge_arch of proj_edge is
   signal sig_d, sig_n, temp  :std_logic;
  begin
sig_d <= sig after del;
sig_n <= not(sig);
temp <= sig_d xor sig_n;
process(sig)
  begin
  if(pos = 1) then
      edg <= (sig and not(sig_d));
    else
      edg <= (not(sig) and sig_d);
  end if;
end process;
end proj_edge_arch;


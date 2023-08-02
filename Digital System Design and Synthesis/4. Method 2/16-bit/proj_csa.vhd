library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
 
entity proj_csa is
  generic(width : integer := 6);
  Port (
    x : in std_logic_vector (width - 1 downto 0); 
    y : in  std_logic_vector (width - 1 downto 0);
    z : in  std_logic_vector (width - 1 downto 0);
    s : out std_logic_vector (width - 1 downto 0);
    c : out std_logic_vector (width - 1 downto 0)
      );
end proj_csa;
 
architecture proj_csa_arch of proj_csa is
  begin
  gen_csa : for i in (width - 1) downto 0 generate 
    
       s(i)<= ((x(i) xor y(i)) xor z(i));
       c(i) <= (x(i) and y(i)) or (x(i) and z(i)) or (y(i) and z(i)); 
end generate gen_csa;  
  
  end proj_csa_arch;


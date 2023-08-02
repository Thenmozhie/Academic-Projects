library ieee;
use ieee. std_logic_1164.all;

entity bsc is
  port(pi,si : in std_logic;
  shift_dr,mode : in std_logic;
  clk_dr,update_dr : in std_logic;
  so,po : out std_logic);
end bsc;

architecture structural of bsc is


component mux
port (a, b, s : in std_logic;
     f : out std_logic);
end component;

component dff_rise
port (q : out std_logic;    
      clk :in std_logic;   
      d :in  std_logic );
end component;
component dff_fall
port (q : out std_logic;    
      clk :in std_logic;   
      d :in  std_logic );
end component;
signal d1,q1, q2 : std_logic;

begin 
mux1:mux port map(pi,si,shift_dr,d1);
ff1:dff_rise port map(q1,clk_dr,d1);
so <= q1;
ff2:dff_fall port map(q2,update_dr,q1);
mux2:mux port map(pi,q2,mode,po);

end structural;

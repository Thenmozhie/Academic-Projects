library ieee;
use ieee. std_logic_1164.all;

entity ir is
  port(tdi : in std_logic;
  shift_ir,dum: in std_logic;
  clk_ir,update_ir : in std_logic;
  lsb, cs1,cs2 : out std_logic);
end ir;

architecture structural of ir is



component mux
port (a, b, s : in std_logic;
     f : out std_logic);
end component;

component dff_rise
port (d : in std_logic;    
      clk :in std_logic;   
      q :out  std_logic );
end component;

component dff_fall
port (d : in std_logic;    
      clk :in std_logic;   
      q :out  std_logic );
end component;

signal d,q1,q2,q3 : std_logic;
 begin
   ----dum := '0';
 mux1:mux port map (dum,tdi,shift_ir,d);
 ff1:dff_rise port map (d,clk_ir,q1);
 ff2:dff_fall port map (q1,update_ir,cs1);
 mux2:mux port map (dum,q1,shift_ir,q2);
 ff3:dff_rise port map (q2,clk_ir,q3);
 lsb<=q3;
 ff4:dff_fall port map (q3,update_ir,cs2);

 end structural; 


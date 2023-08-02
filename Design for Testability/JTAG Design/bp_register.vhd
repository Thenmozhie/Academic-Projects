library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity bp_register is
PORT( tdi,shift_dr,clkdr: in std_logic;
    Q: out std_logic);
end bp_register;
 
architecture structural of bp_register is

signal d: std_logic;
component myAND port(a : in STD_LOGIC;
  b : in STD_LOGIC;
  Y : out STD_LOGIC);
  end component;
  
begin
andgate: myAND port map (shift_dr,tdi,d);
-- D <= tdi AND shift_dr;

process(clkdr)
begin
if rising_edge (clkdr) then
Q <= d;
end if;
end process;


end structural;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity proj_final_tb is
  generic(width : integer := 8);
end proj_final_tb;
  
architecture testbench of proj_final_tb is
  
component proj_toplevel 
generic(width : integer := 8);
port ( 
  a     : in std_logic_vector(width - 1 downto 0);
  b     : in std_logic_vector(width - 1 downto 0);
  clk   : in std_logic;
  load  : in std_logic;
  clr   : in std_logic;
  endF  : out std_logic;
  z     : out std_logic_vector(width*2 - 1 downto 0)
  );
end component;

signal clk,endF_tb,ld_tb,clr_tb : std_logic;
signal z_tb : std_logic_vector(width*2 - 1 downto 0);
signal a_tb,b_tb : std_logic_vector(width - 1 downto 0);

  constant clk_period : time := 10 ns;
begin -- Arch  
    process
    begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
    end process;

a_tb <= x"00", x"04" after 50 ns, x"09" after 100 ns, x"FF" after 160 ns;   

b_tb <= x"00", x"02" after 50 ns, x"05" after 100 ns, x"FF" after 160 ns;

ld_tb <= '1', '0' after 55 ns, '1' after 65 ns, '0' after 115 ns, '1' after 125 ns,  '0' after 175 ns, '1' after 185 ns;      
    
clr_tb <= '0', '1' after 15 ns, '0' after 20 ns, '1' after 200 ns, '0' after 210 ns;

proj_toplevel_1 : proj_toplevel generic map (8) port map( a => a_tb, b => b_tb, clk => clk, load => ld_tb, clr => clr_tb, endF => endF_tb, z => z_tb);          

end testbench;


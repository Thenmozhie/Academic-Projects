library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bp_register_tb is
end bp_register_tb;

architecture structural of bp_register_tb is
component bp_register
  port(tdi,shift_dr,clkdr: in std_logic;
    Q: out std_logic
    );
  end component;
  
signal tdi,shift_dr,clkdr: std_logic := '0';
signal Q: std_logic := '0';
signal test_clk: std_logic;

constant clk_period : time := 10 ns;

begin
bptb: bp_register port map(tdi,shift_dr,clkdr, Q);

clk_process: process
  begin
    test_clk <= '0';
    wait for clk_period/2;
    test_clk <= '1';
    wait for clk_period/2;
  end process;
  
  
  process
  begin
  
  
  tdi <= '0';
  shift_dr<='0';
  clkdr<='0';
  
  wait for clk_period/2;	
  clkdr<='1';
  wait for clk_period/2;	    
  
  tdi <= '0';
  shift_dr<='1';
  clkdr<='0';
  
  wait for clk_period/2;	
  clkdr<='1';
  wait for clk_period/2;	
    
  tdi <= '1';
  shift_dr <= '0';
  clkdr<='0';
  
  wait for clk_period/2;	
  clkdr<='1';
  wait for clk_period/2;	
  
  tdi <= '1';
  shift_dr <= '1';
  clkdr<='0';
  
  wait for clk_period/2;	
  clkdr<='1';
  wait for clk_period/2;	
    
wait;

  end process;

end structural;
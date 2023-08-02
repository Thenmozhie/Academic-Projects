library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bsc_tb is
end bsc_tb;

architecture structural of bsc_tb is
    component bsc
                    port (pi,si : in std_logic;
  shift_dr,mode : in std_logic;
  clk_dr,update_dr : in std_logic;
  so,po : out std_logic);
    end component;
	
	signal pi,si: std_logic;
	signal shift_dr,mode: std_logic;
	signal clk_dr,update_dr: std_logic;
	signal so,po: std_logic;
	
	constant clk_period: time :=10ns;
	
begin
bsctb: bsc port map (pi,si,shift_dr,mode,clk_dr,update_dr,so,po);
clock: process
    begin
        clk_dr <= '0';
        update_dr <= '0';
        wait for clk_period/2;
        clk_dr <= '1';
        update_dr <= '1';
        wait for clk_period/2; 
    end process;

	simulation: process
begin

-------------------Noraml opratoin-------
mode<='0';
wait for clk_period;
pi<='1';    -----po=1
wait for clk_period;
pi<='0'; -----po=0
wait for clk_period;
mode<='1';

------------------ Scan Operation-------

wait for clk_period;

si<='0';
shift_dr<='0';   -------so somthing
wait for clk_period/2;
shift_dr<='1';  --------- now so= si ie 0
wait for clk_period*2;
mode<='0';
si<='1';         --------- now so= si ie 1

--------------------------- update operation
wait for clk_period;
mode<='1';
----------------------------------capture
wait for clk_period*2;
shift_dr<='1';
wait for clk_period;
shift_dr<='0';
wait for clk_period;
pi<='1';
wait for clk_period*2;
pi<='0';

wait;

end process;

end structural;
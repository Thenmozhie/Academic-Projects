library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bsr_tb is
end bsr_tb;

architecture structural of bsr_tb is
    component bsr
                    port (
                         tdi: in std_logic; 
        tdo: out std_logic; 
        din_i: in std_logic_vector(15 downto 0); -- Data in for input side
        
        dout_i: out std_logic_vector(7 downto 0); -- Data Out for input side
        dout_ii:out std_logic_vector(7 downto 0); -- Data Out for input side
        
        
		din_o: in std_logic_vector(15 downto 0); -- Data In for output side
		
        dout_o: out std_logic_vector(15 downto 0); -- Data Out for output side
        clk_dr: in std_logic; 
        update_dr: in std_logic;
        shift_dr: in std_logic; 
        mode: in std_logic 
                        );
    end component;
	
	
	signal tdi,tdo: std_logic;
	signal clk_dr, update_dr: std_logic;
	signal shift_dr, mode : std_logic;
	signal din_i: std_logic_vector(15 downto 0); -- Data in for input side
    signal dout_i: std_logic_vector(7 downto 0); -- Data Out for input side
    signal dout_ii: std_logic_vector(7 downto 0);
    
	signal din_o: std_logic_vector(15 downto 0); -- Data In for output side
    signal dout_o: std_logic_vector(15 downto 0); -- Data Out for output side
	
	constant clk_period: time :=10ns;
	
	
begin 
bsrtb: bsr port map(tdi,tdo,din_i,dout_i,dout_ii, din_o,dout_o,clk_dr,update_dr,shift_dr,mode);
----------setting clk
clock: process
    begin
        clk_dr <= '0';
		update_dr <= '0';
        wait for clk_period/2;
        clk_dr <= '1';
		update_dr <= '1';
        wait for clk_period/2; 
    end process;
	
stimulus: process
        begin
		
		-- din_i<=(others=>'0');
		-- wait for clk_period;
		-- din_i<=(others=>'0');
		-- dout_i<=(others=>'0');
		-- wait for clk_period;
		-- mode<='0';
		-- din_i<=(others=>'0');
		-- dout_i<=(others=>'0');
		-- wait for clk_period*2;
		-- din_i<=(others=>'1');
		-- dout_i<=(others=>'1');
		
		-------------------Noraml opratoin------- 
mode<='0';
wait for clk_period;
din_i<=(others=>'1');    -----po=1
din_o<=(others=>'1');
wait for clk_period;
din_i<=(others=>'0');
din_o<=(others=>'0'); -----po=0
wait for clk_period;
mode<='1';
wait for clk_period;
mode<='0';
wait for clk_period;
mode<='1';

wait for clk_period;
shift_dr<='1'; 




  for i in 1 to 10 loop
    wait for clk_period;
    
    tdi<='1';
    end loop;
    for i in 1 to 10 loop
    wait for clk_period;
    
    tdi<='0';
    end loop;
    for i in 1 to 12 loop
    wait for clk_period;
    
    tdi<='1';
    end loop;

wait for clk_period*32;
tdi<='0';
------------------ Scan Operation-------

-- wait for clk_period;

-- tdi<='0';
-- shift_dr<='0';   -------tdo somthing
-- wait for clk_period/2;
-- shift_dr<='1';  --------- now tdo= tdi ie 0
-- wait for clk_period*2;
-- mode<='0';
-- tdi<='1';         --------- now tdo= tdi ie 1

------------------------- update operation
-- wait for clk_period;
-- mode<='1';
--------------------------------capture
-- wait for clk_period*2;
-- shift_dr<='1';
-- wait for clk_period;
-- shift_dr<='0';
-- wait for clk_period;
-- din_i<=(others=>'1');
-- wait for clk_period*2;
-- din_i<=(others=>'0');
		
		
		
		
		wait;
        end process;


end structural;
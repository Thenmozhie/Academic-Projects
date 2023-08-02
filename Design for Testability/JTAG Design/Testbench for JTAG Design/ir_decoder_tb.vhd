library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ir_decoder_tb is
end ir_decoder_tb;

architecture structural of ir_decoder_tb is
    component ir_decode
                    port (
                         cs1, cs2: in std_logic;
    mode, sel: out std_logic);
    end component;
	
	signal cs1, cs2:std_logic;
    signal mode, sel:std_logic;	
	constant clk_period: time :=10ns;
	
begin


irdecodertb: ir_decode port map(cs1, cs2, mode, sel);

-- setting clk
-- clock: process
    -- begin
        -- clk <= '0';
        -- wait for clk_period/2;
        -- clk <= '1';
        -- wait for clk_period/2; 
    -- end process;
	
stimulus: process
        begin
		
		
		cs1<='0';cs2<='0';      -----extest---mode=1 sel=0
		
		wait for 10ns;
		
		cs1<='1';cs2<='0';     ------sample ----mode=0 sel=0
		
		wait for 10ns;
		
		cs1<='1';cs2<='1';     -------bypass---mode=1 sel=1
		
		wait for 10ns;
		
		cs1<='0';cs2<='1';      -------preload---mode=0 sel=1
		
		wait;
        end process;		


end structural;
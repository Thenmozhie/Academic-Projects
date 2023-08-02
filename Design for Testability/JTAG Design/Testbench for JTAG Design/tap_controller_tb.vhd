library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tap_controller_tb is
end tap_controller_tb;

architecture structural of tap_controller_tb is
    component tap_controller
                    port (
                         tms, rst, clk: in std_logic;
        sel, dr_clk, ir_clk, dr_capture, dr_shift, dr_update: out std_logic;
        ir_shift, ir_update,ir_capture : out std_logic
                        );
    end component;
	
	signal tms, rst, clk: std_logic :='0';
	signal sel, dr_clk, ir_clk, dr_capture, dr_shift, dr_update: std_logic :='0';
	signal ir_shift, ir_update,ir_capture : std_logic :='0';
	
	constant clk_period: time :=10ns;
	
begin

tabtb: tap_controller port map(tms, rst, clk, sel, dr_clk, ir_clk, dr_capture, dr_shift, dr_update,ir_shift, ir_update,ir_capture);

----------setting clk
clock: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2; 
    end process;
	
stimulus: process
        begin
		
		
		rst  <='1';
        wait for clk_period*5;
        rst <= '0';
        wait for clk_period*2;
		
		tms <='1';
		wait for clk_period;
		tms <='1';
		wait for clk_period;
		tms <='1';
		wait for clk_period;
		tms <='1';
		wait for clk_period;
		tms <='1';
		wait for clk_period;
		
		tms <='0';
		wait for clk_period;
		tms <='1';
		wait for clk_period;
		tms <='0';
		wait for clk_period;
		
		
		
        -- EXTEST
        -- tms <= '0';
        -- wait for clk_period;
        -- tms <= '0';
        -- wait for clk_period;
        -- tms <= '0';
        -- wait for clk_period;
        -- tms <= '0';
        ---SP
        -- wait for clk_period;
        -- tms <= '1';
        -- wait for clk_period;
        -- tms <= '0';
        -- wait for clk_period;
        -- tms <= '0';
        -- wait for clk_period;
        -- tms <= '1';
        -- wait for clk_period;       
        -- BYPASS
        -- tms <= '1';
        -- wait for clk_period;
        -- tms <= '1';
        -- wait for clk_period;
        -- tms <= '1';
        -- wait for clk_period;
        -- tms <= '1';
       wait;
        end process;


end structural;
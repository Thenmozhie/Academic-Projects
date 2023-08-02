library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ir_tb is
end ir_tb;


architecture structural of ir_tb is
    component ir
                    port (
                         tdi : in std_logic;
  shift_ir,dum: in std_logic;
  clk_ir,update_ir : in std_logic;
  lsb, cs1,cs2 : out std_logic);
    end component;
	
	signal tdi: std_logic;
	signal shift_ir,dum: std_logic;
	signal clk_ir,update_ir: std_logic;
	signal lsb, cs1,cs2:std_logic;
	
	constant clk_period: time :=10ns;
	
begin
irtb: ir port map(tdi,shift_ir,dum,clk_ir,update_ir,lsb,cs1,cs2);

----------setting clk
--clock: process
   -- begin
    --    clk_ir <= '0';
		--update_ir <= '0';
   --     wait for clk_period/2;
    --    clk_ir <= '1';
	--	update_ir <= '1';
   --     wait for clk_period/2; 
   -- end process;

	stimulus: process
        begin
          dum<='0';
		  shift_ir <='1';
		  tdi<='0';
		clk_ir<='0';
		wait for clk_period/2;
		clk_ir<='1';
		wait for clk_period/2;
		tdi<='1';
		clk_ir<='0';
		wait for clk_period/2;
		clk_ir<='1';
		update_ir<='1';
		wait for clk_period/2;
		update_ir<='0';
		
		
		
		wait;
        end process;
end structural;
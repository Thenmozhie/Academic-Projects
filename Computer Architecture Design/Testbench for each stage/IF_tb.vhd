--VHDL code for Instruction Fetch test bench
--VHDL code for Instriction Fetch Module
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;  



entity inst_fetch_tb is
 
end inst_fetch_tb;


architecture beh of inst_fetch_tb is

component inst_fetch
port(
 clk : in std_logic; 
 sel: in std_logic;
 mux2: in std_logic_vector(31 downto 0);
 inst: out  std_logic_vector(31 downto 0);
 add_out:out std_logic_vector (31 downto 0)
);
end component;

signal clk_t : std_logic; 
signal sel_t: std_logic;
signal mux2_t: std_logic_vector(31 downto 0);
signal inst_t: std_logic_vector(31 downto 0);
signal add_out_t: std_logic_vector (31 downto 0);

constant clk_period: time :=10ns;

begin
  
  instruction_fetch : inst_fetch port map (clk_t,sel_t,mux2_t,inst_t,add_out_t);

-------clk setting----------

clock : process

          begin
          
            clk_t <= '0';
            wait for clk_period/2;
            clk_t <= '1';
            wait for clk_period/2;
          
          end process;
      
simulation : process
              
              begin
                
                sel_t <= '1';
                mux2_t <= "00000000000000000000000000000000";
                wait for clk_period;
             
                sel_t <= '0';
                mux2_t <= "00000000000000000000000000000100" ;
                wait for clk_period;
                
                wait for 200ns;
             
            
                    wait;
            end process;
       
              
end beh;
                      
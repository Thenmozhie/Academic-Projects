--VHDL code for slicing instruction 
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all; 

entity inst_slicing is

 port(
   clk: in std_logic;
 inst: in std_logic_vector(31 downto 0);  --inst out from IF
 
 rs : out std_logic_vector(4 downto 0);
 rt : out std_logic_vector(4 downto 0);
 rd : out std_logic_vector(4 downto 0);
 
 imm_in : out std_logic_vector(15 downto 0);  --Immediate value
 
 Jump_add : out std_logic_vector(25 downto 0 ); --for jump instruction
 h : out std_logic_vector(31 downto 0) --for SRL instruction
 
 );
 end inst_slicing;
 
 architecture beh of inst_slicing is
 begin
   process(inst)
     
     begin
         
         
     
    --if(rising_edge(clk)) then
 
    rs <= inst(25 downto 21);
    rt <= inst(20 downto 16);
    rd <= inst(15 downto 11);
    imm_in <= inst(15 downto 0);
    jump_add <= inst(25 downto 0);
	  h <= "000000000000000000000000000" & inst(10 downto 6);
	  
	  --end if;
	  end process;
			
  
end beh;
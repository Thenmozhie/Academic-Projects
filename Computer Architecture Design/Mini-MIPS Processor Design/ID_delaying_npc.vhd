
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity npc is
    port (
        clk : in std_logic;
        npc_in : in std_logic_vector(31 downto 0);
        rs_in : in std_logic_vector(4 downto 0);
         rt_in : in std_logic_vector(4 downto 0);
         rd_in : in std_logic_vector(4 downto 0);
         
         imm_in : in std_logic_vector(31 downto 0);  --Immediate value
         
         Jump_add_in : in std_logic_vector(25 downto 0 ); --for jump instruction
         h_in : in std_logic_vector(31 downto 0); --for SRL instru
        
        
        
        
        
        npc_out : out std_logic_vector(31 downto 0);
        rs_out : out std_logic_vector(4 downto 0);
         rt_out : out std_logic_vector(4 downto 0);
         rd_out : out std_logic_vector(4 downto 0);
         
         imm_out : out std_logic_vector(31 downto 0);  --Immediate value
         
         Jump_add_out : out std_logic_vector(25 downto 0 ); --for jump instruction
         h_out : out std_logic_vector(31 downto 0) --for SRL instru
    );
end npc;




architecture beh of npc is
  
begin

    process (clk)
    begin
        
        if rising_edge(clk) then
    
                  
               
              
              
        npc_out<=npc_in;      
          rs_out<=rs_in; 
                 rt_out<=rt_in;
                 rd_out<=rd_in;
                 
                 imm_out<=imm_in;
                 
                 Jump_add_out<=Jump_add_in;
                 h_out<=h_in;       
              
              
              
            
            
        end if;  
        
         
        
        
    end process;
        
            
end architecture beh;

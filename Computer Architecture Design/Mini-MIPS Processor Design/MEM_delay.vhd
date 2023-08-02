
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_delay is
    port (
        clk : in std_logic;
        RegWrite_in_dealy : in std_logic;
        MemtoReg_in_delay : in std_logic;
        result_in_delay:in std_logic_vector(31 downto 0);
        registerdestination_delay: in std_logic_vector(4 downto 0);
        
        RegWrite_out_delay : out std_logic;
                MemtoReg_out_delay : out std_logic;
                result_out_delay:out std_logic_vector(31 downto 0);
                registerdestination_out_delay: out std_logic_vector(4 downto 0)
        
        
    );
end mem_delay;




architecture beh of mem_delay is
  
begin

    process (clk)
    begin
        
        if rising_edge(clk) then
    
                  
               
              
              
        RegWrite_out_delay<=RegWrite_in_dealy;
        MemtoReg_out_delay<=MemtoReg_in_delay;
        result_out_delay<=result_in_delay;
        registerdestination_out_delay<=registerdestination_delay;   
              
              
              
              
            
            
        end if;  
        
         
        
        
    end process;
        
            
end architecture beh;
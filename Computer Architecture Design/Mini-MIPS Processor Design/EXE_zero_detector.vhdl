library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity zero_detector is
        port(result:in std_logic_vector(31 downto 0);
             Zero_out:out std_logic);
               
end zero_detector;

architecture behaviour of zero_detector is
begin
        process(result)
        begin
         case result is
            
          when "00000000000000000000000000000000"=>      
          
          Zero_out <= '1' ;
            
          when others =>
          Zero_out <= '0';
        
        end case;
        
        end process;
end behaviour; 
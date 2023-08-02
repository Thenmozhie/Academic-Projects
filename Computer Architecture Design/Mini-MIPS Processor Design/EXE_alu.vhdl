library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
        port(a:in std_logic_vector(31 downto 0);
          b:in std_logic_vector(31 downto 0);
          ALUOp: in std_logic_vector(2 downto 0);
               result:out std_logic_vector(31 downto 0));
               
end alu;




architecture behaviour of alu is

----signal for_complementing_imm: std_logic_vector(31 downto 0);


begin
  
process(ALUOp,a,b)



begin
  case ALUOp is
    
    when "110"=> 
     
     
     result <= std_logic_vector(not(unsigned(a) or unsigned(b)));
     
     
    when "010"=> 
      
    result <= std_logic_vector(shift_right(unsigned(b), to_integer(unsigned(a(4 downto 0)))));  
  
    when "100"=> 
       
      result<= std_logic_vector(unsigned(a) xor unsigned(b));  
        
    when "111"=> 
     
      ----for_complementing_imm <= not(b);
      result<= std_logic_vector(a nand b);   
       
    when "011"=> 
      
      result<= std_logic_vector(unsigned(a)- unsigned(b));   
        
    when "000"=> 
      
     result<= std_logic_vector(unsigned(a)+unsigned(b));      
      
    when "001"=> 
            
           result<= std_logic_vector(unsigned(a)-unsigned(b)); 
    when "101"=> 
                       
            result<= std_logic_vector(unsigned(a)+unsigned(b));      
      
      
      
    when others =>
      result <= (others=>'X');  
      
  end case;
   
  
end process;


end behaviour;
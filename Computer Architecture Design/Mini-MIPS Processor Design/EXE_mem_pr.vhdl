library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;




entity ex_mem_pr is
        port(
           clk:in std_logic;
           
           RegWrite_in: in std_logic;
           MemtoReg_in:in std_logic;
           
           
           Branch_in:in std_logic;
           MeanWrite_in: in std_logic;
           MeanRead_in:in std_logic;
           
           add_result_in: in std_logic_vector(31 downto 0);
           Zero_out_in:in std_logic;
           result_in:in std_logic_vector(31 downto 0);
           read_data_2_in: in std_logic_vector(31 downto 0);
           output_reg_dst_in: in std_logic_vector(4 downto 0);
           
           sel_decision_in: in std_logic_vector(1 downto 0);
           
           
           RegWrite_out: out std_logic;
           MemtoReg_out:out std_logic;
                      
                      
           Branch_out:out std_logic;
           MeanWrite_out: out std_logic;
           MeanRead_out:out std_logic;
                      
           add_result_out: out std_logic_vector(31 downto 0);
           Zero_out_out:out std_logic;
           result_out:out std_logic_vector(31 downto 0);
           read_data_2_out: out std_logic_vector(31 downto 0);
           
           sel_decision_out: out std_logic_vector(1 downto 0);
           
           output_reg_dst_out: out std_logic_vector(4 downto 0));
end ex_mem_pr;






architecture behaviour of ex_mem_pr is 
begin
  
  
  process(clk)
    begin
    if rising_edge(clk) then
      
    
    RegWrite_out <= RegWrite_in;
    MemtoReg_out <= MemtoReg_in;
    Branch_out <= Branch_in;
    MeanWrite_out <= MeanWrite_in;
    MeanRead_out <= MeanRead_in;
    add_result_out <= add_result_in;
    Zero_out_out <= Zero_out_in;
    result_out <= result_in;
    read_data_2_out <= read_data_2_in;
    output_reg_dst_out <= output_reg_dst_in;
    
    sel_decision_out<=sel_decision_in;
    
    
    end if;
    
  end process;
  
  
  
  
end behaviour;  
  
  
  
  
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;  



entity mem_tb is
 
end mem_tb;


architecture beh of mem_tb is

component mem_stage
port(
 clk : in std_logic;
  --reset: in std_logic;
  
  
  ex_result_out, ex_read_data_2_out:in std_logic_vector(31 downto 0);	  --Inputs to data memory
  output_reg_dst: in std_logic_vector(4 downto 0); --From ex_stage RegDst output which is the input for memory stage
  RegWrite: in std_logic;
  MemtoReg:in std_logic;

  --CONTROL PATH
  ---Branch:in std_logic;
  ---Zero_out:in std_logic;
  ---PCSrc: out std_logic;	   
  
  MeanWrite,MeanRead: in std_logic;	
  
  
  result_mem_out,read_data:out std_logic_vector(31 downto 0); --two output from data memory
  output_reg_dst_out: out std_logic_vector(4 downto 0); --From ex_stage RegDst output
  RegWrite_out: out std_logic;
  MemtoReg_out:out std_logic
);
end component;

signal clk_t : std_logic; 
signal ex_result_out_t: std_logic_vector(31 downto 0);
signal ex_read_data_2_out_t: std_logic_vector(31 downto 0);
signal output_reg_dst_t: std_logic_vector(4 downto 0);
signal RegWrite_t: std_logic;
signal MemtoReg_t: std_logic;
signal MeanWrite_t: std_logic;
signal MeanRead_t: std_logic;

signal result_mem_out_t:std_logic_vector(31 downto 0);
signal read_data_t:std_logic_vector(31 downto 0);
signal output_reg_dst_out_t:std_logic_vector(4 downto 0);
signal RegWrite_out_t:std_logic;
signal MemtoReg_out_t:std_logic;

constant clk_period: time :=10ns;

begin
  
  for_testing : mem_stage port map (clk_t,ex_result_out_t,ex_read_data_2_out_t,output_reg_dst_t,RegWrite_t,MemtoReg_t,MeanWrite_t,MeanRead_t,result_mem_out_t,read_data_t,output_reg_dst_out_t,RegWrite_out_t,MemtoReg_out_t);

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
                ex_result_out_t<="00000000000000000000000000001001";     -------writing data----------
                ex_read_data_2_out_t<="01111101000100010000000000001001";
                output_reg_dst_t<="00000";
                
                RegWrite_t<='0';
                MemtoReg_t<='0'; 
                
                MeanWrite_t<='1';
                MeanRead_t<='0';
                wait for clk_period;
                
                
                
                ex_result_out_t<="00000000000000000000000000001001";   ---readding data----------
                ex_read_data_2_out_t<="00000000000000000000000000000000";
                output_reg_dst_t<="00000";
                                
                RegWrite_t<='0';
                MemtoReg_t<='0'; 
                                
                MeanWrite_t<='0';
                MeanRead_t<='1';
                wait for clk_period;
                
                
                    
            end process;
       
              
end beh;
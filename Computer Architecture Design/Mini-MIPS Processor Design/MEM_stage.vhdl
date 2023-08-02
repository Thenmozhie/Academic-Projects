--VHDL CODE FOR MEMORY STAGE
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mem_stage is
port
(	clk : in std_logic;
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
end mem_stage;

architecture beh of mem_stage is

 component data_mem 
port
 (
  clk:in std_logic;
  --reset: in std_logic;
  
  ex_result_out, ex_read_data_2_out:in std_logic_vector(31 downto 0);	  
  MeanWrite,MeanRead: in std_logic;
  --result_mem_out,
  read_data:out std_logic_vector(31 downto 0)
 );
 end component;
 
 
 
 
 
 component mem_delay 
 port
  (
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
  end component;
 
 
 
 
 
 
 component mw_buffer
 port
 (	
 clk : in std_logic;
 
   result_mem,read_data:in std_logic_vector(31 downto 0);
   output_reg_dst: in std_logic_vector(4 downto 0);
   RegWrite: in std_logic;
   MemtoReg:in std_logic;
 
   result_mem_out,read_data_out:out std_logic_vector(31 downto 0);
   output_reg_dst_out: out std_logic_vector(4 downto 0);
   RegWrite_out: out std_logic;
   MemtoReg_out:out std_logic
);
end component;





component forwarding_unit_mem_mem 
port(rt1,rt2:in std_logic_vector(4 downto 0);
             sel1:out std_logic);
               
end component;


component mux1
  port (
  s : in std_logic;
  a, b : in std_logic_vector(31 downto 0);
  mout : out std_logic_vector(31 downto 0)
  ); 
end component;




signal sig1 : std_logic_vector(31 downto 0);
signal RegWrite_t: std_logic;
signal MemtoReg_t: std_logic;
signal ex_result_out_t: std_logic_vector(31 downto 0);
signal output_reg_dst_t: std_logic_vector(4 downto 0);

signal fw_sel : std_logic;
signal mux_to_mem: std_logic_vector(31 downto 0);

begin


memory: data_mem port map (clk,ex_result_out,mux_to_mem,MeanWrite,MeanRead,sig1);
  
for_delaying:mem_delay port map(clk,RegWrite,MemtoReg,ex_result_out,output_reg_dst,RegWrite_t,MemtoReg_t,ex_result_out_t,output_reg_dst_t);  

MWbuffer: mw_buffer port map (clk,ex_result_out_t,sig1,output_reg_dst_t,RegWrite_t,MemtoReg_t,result_mem_out,read_data, output_reg_dst_out, RegWrite_out,MemtoReg_out);

forwarding_mem_mem : forwarding_unit_mem_mem port map (output_reg_dst,output_reg_dst_t,fw_sel);

mux_mem : mux1 port map (fw_sel,ex_read_data_2_out,sig1,mux_to_mem); 

end beh;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity id_tb is
end id_tb;


architecture beh of id_tb is
  

component inst_decode port (clk: in std_logic;
 
 add_in: in std_logic_vector(31 downto 0);  --from adder in IF
 instruction: in std_logic_vector(31 downto 0);  --inst out from IF
 WriteReg: in std_logic_vector(4 downto 0);
 WriteData: in std_logic_vector(31 downto 0);
 RegWrite: in std_logic;
 
 add_out: out std_logic_vector(31 downto 0); --from adder in IF
 read_data_1_out: out std_logic_vector(31 downto 0);  
 read_data_2_out: out std_logic_vector(31 downto 0);
 imm_out : out std_logic_vector(31 downto 0);
 reg_dest1_out: out std_logic_vector(4 downto 0);
 reg_dest2_out: out std_logic_vector(4 downto 0);
 
 Jump_add_out : out std_logic_vector(25 downto 0 );
 
 --CONTROL UNIT
 
 Regwrite_out : out std_logic;
 MemtoReg_out : out std_logic;
 
 Branch_out : out std_logic;
 MeanRead_out : out std_logic;
 MeanWrite_out : out std_logic;
 
 RegDst_out : out std_logic;
 ALUOp_out : out std_logic_vector(2 downto 0);
 ALUSrc_out : out std_logic;
 
 Jump_out : out std_logic_vector(1 downto 0));
 
 end component;
 
 


signal add_in_t:std_logic_vector(31 downto 0):=(others=>'0');  --from adder in IF
signal instruction_t:std_logic_vector(31 downto 0):=(others=>'0');  --inst out from IF
signal WriteReg_t: std_logic_vector(4 downto 0):=(others=>'0');
signal WriteData_t:std_logic_vector(31 downto 0):=(others=>'0');
signal RegWrite_t: std_logic:='0';
 
 signal add_out_t: std_logic_vector(31 downto 0):=(others=>'0'); --from adder in IF
 signal read_data_1_out_t: std_logic_vector(31 downto 0):=(others=>'0');  
 signal read_data_2_out_t: std_logic_vector(31 downto 0):=(others=>'0');
 signal imm_out_t : std_logic_vector(31 downto 0):=(others=>'0');
 signal reg_dest1_out_t: std_logic_vector(4 downto 0):=(others=>'0');
 signal reg_dest2_out_t: std_logic_vector(4 downto 0):=(others=>'0');
 
 signal Jump_add_out_t : std_logic_vector(25 downto 0 ):=(others=>'0');
 
 --CONTROL UNIT
 
 signal Regwrite_out_t : std_logic:='0';
 signal MemtoReg_out_t : std_logic:='0';
 
 signal Branch_out_t : std_logic:='0';
 signal MeanRead_out_t : std_logic:='0';
 signal MeanWrite_out_t : std_logic:='0';
 
 signal RegDst_out_t : std_logic:='0';
 signal ALUOp_out_t : std_logic_vector(2 downto 0):=(others=>'0');
 signal ALUSrc_out_t : std_logic:='0';
 
 signal Jump_out_t : std_logic_vector(1 downto 0):=(others=>'0');
 


 
 
signal test_clk:std_logic;
 
 
 
 
constant clk_period:time:=10ns;
 
begin
   
with_tb: inst_decode port map(test_clk,add_in_t,instruction_t,WriteReg_t,WriteData_t,RegWrite_t,add_out_t,read_data_1_out_t,read_data_2_out_t,imm_out_t,reg_dest1_out_t,reg_dest2_out_t,Jump_add_out_t,Regwrite_out_t,MemtoReg_out_t,Branch_out_t,MeanRead_out_t,MeanWrite_out_t,RegDst_out_t,ALUOp_out_t,ALUSrc_out_t,Jump_out_t);
  
  

clk_process:process
begin
  test_clk<='0';
  wait for clk_period/2;
  test_clk<='1';
  wait for clk_period/2;
end process;




process
  begin
    
    add_in_t<="01111101000100010000000000001001";
    instruction_t<="00100001000100010000000000001001";----ADDI--r8
    WriteReg_t<="00000";
    WriteData_t<="00100001000100000000000000000000";
    RegWrite_t<='0';
    wait for clk_period;
    
    add_in_t<="01111101000100010000000000001001";
    instruction_t<="00110000010100000000000000000011";----NANDI--r2
    WriteReg_t<="00000";
    WriteData_t<="00100001000100000000000000000000";
    RegWrite_t<='0';
    wait for clk_period;
    
    
    
    add_in_t<="01111101000100010000000000001001";
    instruction_t<="00110100110000110000000000000111";----NORI--r6
    WriteReg_t<="00000";
    WriteData_t<="00100001000100000000000000000000";
    RegWrite_t<='0';
    wait for clk_period;
    
                                               ---------Now exticiting RegWrite='1'-------------
    
    add_in_t<="01111101000100010000000000001001";
    instruction_t<="00110100110000110000000000000111";----NORI--r6 
    WriteReg_t<="00001";                     ----written in R1-------
    WriteData_t<="00101011101110101010101010101010";
    RegWrite_t<='1';
    wait for clk_period;
                                        -----------checking whether the data was written----------
    add_in_t<="01111101000100010000000000001001";
    instruction_t<="00000001000000010001000000100011";----SUBU R2,R8,R1
    WriteReg_t<="00000";
    WriteData_t<="00101011101110101010101010101010";
    RegWrite_t<='0';
    wait for clk_period;
    
    
    
    -----------checking shamt----------
add_in_t<="01111101000100010000000000001001";
instruction_t<="00000000000000000010000010000010";----SRL
WriteReg_t<="00000";
WriteData_t<="00101011101110101010101010101010";
RegWrite_t<='0';
wait for clk_period;

wait for clk_period;
    
    
    
    
    
    
end process;

end beh;



 
 
--VHDL code for ID stage Buffer
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;  

entity inst_decode is
 port(
 
 clk: in std_logic;
 
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
 rs_out : out std_logic_vector(4 downto 0);
 
 --CONTROL UNIT
 
 Regwrite_out : out std_logic;
 MemtoReg_out : out std_logic;
 
 Branch_out : out std_logic;
 MeanRead_out : out std_logic;
 MeanWrite_out : out std_logic;
 
 RegDst_out : out std_logic;
 ALUOp_out : out std_logic_vector(2 downto 0);
 ALUSrc_out : out std_logic;
 
 Jump_out : out std_logic_vector(1 downto 0)
 
	);
end inst_decode;

Architecture beh of inst_decode is

component inst_slicing
 port(clk: in std_logic;
   
 inst: in std_logic_vector(31 downto 0);  --inst out from IF
 
 rs : out std_logic_vector(4 downto 0);
 rt : out std_logic_vector(4 downto 0);
 rd : out std_logic_vector(4 downto 0);
 
 imm_in : out std_logic_vector(15 downto 0);  --Immediate value
 
 Jump_add : out std_logic_vector(25 downto 0 ); --for jump instruction
 h : out std_logic_vector(31 downto 0) --for SRL instruction
 
    );
end component;
 
component reg_file
    port (
        clk: in std_logic;
        RegWrite: in std_logic;
        write_reg: in std_logic_vector(4 downto 0);
        write_data: in std_logic_vector(31 downto 0);
        read_reg_1: in std_logic_vector(4 downto 0);
        read_reg_2: in std_logic_vector(4 downto 0);
        read_data_1: out std_logic_vector(31 downto 0);
        read_data_2: out std_logic_vector(31 downto 0)
		);
end component;

component sign_ext
  port (
		input_imm  : in  std_logic_vector(15 downto 0);
		output_imm : out std_logic_vector(31 downto 0)
		);
end component;

component controlunit
  port(clk: in std_logic;
        Inst : in std_logic_vector (31 downto 0);
        --reset : in std_logic;
        ALUOp : out std_logic_vector(2 downto 0);
        RegDst, ALUsrc, Branch, MemRead, MemWrite, RegWrite, MemtoReg: out std_logic;  
        Jump : out std_logic_vector(1 downto 0);
        sel_shamt : out std_logic
  );
end component;

component mux1
 port
 (
	s : in std_logic;
	a, b : in std_logic_vector(31 downto 0);
	mout : out std_logic_vector(31 downto 0)
	); 
end component;


component npc
 port
 (
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
end component;



component IDbuffer 
 port
 ( 
 clk: in std_logic;
 
 add_in: in std_logic_vector(31 downto 0);
 read_data_1: in std_logic_vector(31 downto 0);
 read_data_2: in std_logic_vector(31 downto 0);
 imm_in : in std_logic_vector(31 downto 0);
 reg_dest1: in std_logic_vector(4 downto 0);
 reg_dest2: in std_logic_vector(4 downto 0);
 Jump_add : in std_logic_vector(25 downto 0 );
 rs : in std_logic_vector(4 downto 0);
 
 add_out: out std_logic_vector(31 downto 0);
 read_data_1_out: out std_logic_vector(31 downto 0);
 read_data_2_out: out std_logic_vector(31 downto 0);
 imm_out : out std_logic_vector(31 downto 0);
 reg_dest1_out: out std_logic_vector(4 downto 0);
 reg_dest2_out: out std_logic_vector(4 downto 0);
 Jump_add_out : out std_logic_vector(25 downto 0 );
 rs_out : out std_logic_vector(4 downto 0);
 
 --CONTROL UNIT
 Regwrite : in std_logic;
 MemtoReg : in std_logic;
 Branch : in std_logic;
 MeanRead : in std_logic;
 MeanWrite : in std_logic;
 RegDst : in std_logic;
 ALUOp : in std_logic_vector(2 downto 0);
 ALUSrc : in std_logic;
 Jump : in std_logic_vector(1 downto 0);
 
 Regwrite_out : out std_logic;
 MemtoReg_out : out std_logic;
 Branch_out : out std_logic;
 MeanRead_out : out std_logic;
 MeanWrite_out : out std_logic;
 RegDst_out : out std_logic;
 ALUOp_out : out std_logic_vector(2 downto 0);
 ALUSrc_out : out std_logic;
 Jump_out : out std_logic_vector(1 downto 0)
);
end component;


 
 
signal RW, MMR, B,MR,MW,RDST,ASRC,sshamt: std_logic;
signal rd1,rd2,add_in_d: std_logic_vector(31 downto 0);
signal temp : std_logic_vector(31 downto 0);
signal AOP : std_logic_vector(2 downto 0);
signal J : std_logic_vector (1 downto 0);
signal immin: std_logic_vector(15 downto 0);
signal immout,immout_d: std_logic_vector(31 downto 0);
signal rs,rs_d : std_logic_vector(4 downto 0);


signal rt,rt_d : std_logic_vector(4 downto 0);
signal rd,rd_d: std_logic_vector(4 downto 0);

signal jumpadd,jumpadd_d : std_logic_vector(25 downto 0 ); --for jump instruction
signal h,h_d: std_logic_vector(31 downto 0); --for SRL instruction
---signal inst : std_logic_vector(31 downto 0);  --Immediate value


begin
 
Instruction_slicing : inst_slicing port map (clk,instruction, rs,rt,rd,immin,jumpadd,h);  
  
registerID : reg_file port map (clk, RegWrite, WriteReg, WriteData, rs, rt, temp, rd2);

signextend : sign_ext port map (immin,immout);

controlpath : controlunit port map (clk,instruction,AOP, RDST, ASRC, B, MR, MW, RW, MMR, J, sshamt);

mux_srl : mux1 port map (sshamt,temp,h_d,rd1);
  
for_delaying_npc: npc port map(clk, add_in,rs,rt,rd,immout,jumpadd,h,add_in_d,rs_d,rt_d,rd_d,immout_d,jumpadd_d,h_d);  

bufferID : IDbuffer port map (clk,add_in_d,rd1,rd2,immout_d,rt_d,rd_d, jumpadd_d,rs_d, add_out, read_data_1_out, read_data_2_out,imm_out,reg_dest1_out,reg_dest2_out, Jump_add_out,rs_out, RW, MMR, B,MR,MW,RDST,AOP,ASRC,J,Regwrite_out, MemtoReg_out,
Branch_out, MeanRead_out, MeanWrite_out, RegDst_out, ALUOp_out, ALUSrc_out, Jump_out);

       
end beh;
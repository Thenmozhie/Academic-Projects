--VHDL code for IF/ID Buffer
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;  

entity IDbuffer is
 port(
 
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
end IDbuffer;

Architecture beh of IDbuffer is

begin
process(clk)

	begin
	  
	  

		if(rising_edge(clk)) then
		
			add_out <= add_in;
			
			imm_out <= imm_in;
			reg_dest1_out <= reg_dest1;
			reg_dest2_out <= reg_dest2;
		
		--CONTROL UNIT
			RegWrite_out <= RegWrite;
			MemtoReg_out <= MemtoReg;
			Branch_out <= Branch;
			MeanRead_out <= MeanRead;
			MeanWrite_out <= MeanWrite;
			RegDst_out <= RegDst;
			ALUOp_out <= ALUOp;
			ALUSrc_out <= ALUSrc;
			Jump_out <= Jump;
			Jump_add_out <= Jump_add;
			
			---elsif falling_edge(clk) then
			
			read_data_1_out <= read_data_1;
      read_data_2_out <= read_data_2;
      rs_out <= rs;
		end if;

	end process; 
	 
	 

end Beh;
		
 

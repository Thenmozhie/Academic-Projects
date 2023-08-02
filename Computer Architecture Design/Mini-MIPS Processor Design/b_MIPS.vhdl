library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity MIPS is 
  port( clk: in std_logic);
end MIPS;

                                 

architecture behaviour of MIPS is
                                -----------------------IF stage---------------------------------------
component inst_fetch is 
port( clk : in std_logic; 
 sel: in std_logic;
 mux2: in std_logic_vector(31 downto 0);
 inst: out  std_logic_vector(31 downto 0);
 add_out:out std_logic_vector (31 downto 0));
end component; 

                                -----------------------ID stage---------------------------------------
component inst_decode is 
port( clk: in std_logic;
 
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
 
 Jump_out : out std_logic_vector(1 downto 0));
end component; 

                                  -----------------------EXE stage---------------------------------------
component ex_stage_wth_pr is 
port( clk: in std_logic;
           
           jump_addr:in std_logic_vector(25 downto 0);
           sel_decision: in std_logic_vector(1 downto 0); ----for J,JR,B-----
           
           RegWrite: in std_logic;
           MemtoReg:in std_logic;
                      
                      
           Branch:in std_logic;
           MeanWrite: in std_logic;
           MeanRead:in std_logic;
           
           RegDst:in std_logic;
           ALUOp: in std_logic_vector(2 downto 0);
           ALUSrc:in std_logic;           
           
           npc:in std_logic_vector(31 downto 0);
           read_data_1: in std_logic_vector(31 downto 0);
           read_data_2: in std_logic_vector(31 downto 0);
           imm:in std_logic_vector(31 downto 0);
           rt:in std_logic_vector(4 downto 0);
           rd:in std_logic_vector(4 downto 0);
           
           
           
           RegWrite_out: out std_logic;
           MemtoReg_out:out std_logic;
           
           sel_decision_out:out std_logic_vector(1 downto 0);                      
                                 
           Branch_out:out std_logic;
           MeanWrite_out: out std_logic;
           MeanRead_out:out std_logic;
                                 
           add_result_out: out std_logic_vector(31 downto 0);
           Zero_out_out:out std_logic;
           result_out:out std_logic_vector(31 downto 0);
           read_data_2_out: out std_logic_vector(31 downto 0);
           output_reg_dst_out: out std_logic_vector(4 downto 0));
end component;
                                  -----------------------MEM stage---------------------------------------
                                  
component and_gate is
port(a,b:in std_logic;
  c: out std_logic);
end component;  


component and_gate_mux is
        port(s:in std_logic_vector(1 downto 0);
             a:in std_logic;
               o:out std_logic);
end component;                    
                                  
                                  
                                  
                                  
component mem_stage is 
port( clk : in std_logic;
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
  MemtoReg_out:out std_logic);
end component;

                                    -----------------------WB stage---------------------------------------
component writeback is 
port( read_data: in std_logic_vector(31 downto 0);
  alu_out: in std_logic_vector(31 downto 0);
  MemtoReg: in std_logic;
  wb_out:out std_logic_vector(31 downto 0));
end component;


------forwarding unit--------

component forwarding_unit_alu_alu is
        port(rs,rt,reg_dst:in std_logic_vector(4 downto 0);
             sel1,sel2:out std_logic);
               
end component;

component mux_2_1 is
        port(a:in std_logic_vector(31 downto 0);
             b:in std_logic_vector(31 downto 0);
               s:in std_logic;
               o:out std_logic_vector(31 downto 0));
end component;

                   -------signals in IF stage-----

signal PCSrc: std_logic;
signal eff_addr_IF,npc_ID,instruction_ID: std_logic_vector(31 downto 0);


                    -------signals in ID stage-----

signal RegWrite_ID: std_logic;
signal Write_data_ID: std_logic_vector(31 downto 0);
signal Write_reg_ID: std_logic_vector(4 downto 0);


signal npc_EXE, read_data_1_EXE, read_data_2_EXE, imm_EXE:std_logic_vector(31 downto 0);
signal reg_dest1_EXE, reg_dest2_EXE:std_logic_vector(4 downto 0);
signal jump_addr_EXE:std_logic_vector(25 downto 0);

signal Regwrite_EXE, MemtoReg_EXE, Branch_EXE, MeanRead_EXE, MeanWrite_EXE, RegDst_EXE, ALUSrc_EX:std_logic;
signal ALUOp_EXE: std_logic_vector(2 downto 0);
signal Jump_sel_EXE: std_logic_vector(1 downto 0);


                    -------signals in EXE stage-----
signal RegWrite_MEM, MemtoReg_MEM, Branch_MEM, MeanWrite_MEM, MeanRead_MEM, Zero_out_MEM:std_logic;
signal result_MEM,read_data_2_MEM:std_logic_vector(31 downto 0); 
signal output_reg_dest_MEM:std_logic_vector(4 downto 0);
signal Jump_sel_MEM: std_logic_vector(1 downto 0);

                    -------signals in MEM stage-----
signal read_data_WB, result_WB: std_logic_vector(31 downto 0);
signal MemtoReg_WB: std_logic;
signal gate_to_mux: std_logic;


---------------signal for forwarding----------
signal sel1: std_logic;
signal sel2: std_logic; 
signal mux1_to_exe_stage:std_logic_vector(31 downto 0);
signal mux2_to_exe_stage:std_logic_vector(31 downto 0);
signal rs:std_logic_vector(4 downto 0);
            
              

begin
 
Instruction_fetch_stage:inst_fetch port map(clk,PCSrc,eff_addr_IF,instruction_ID,npc_ID);

Instruciton_decode_stage:inst_decode port map(clk,npc_ID,instruction_ID,Write_reg_ID,Write_data_ID,RegWrite_ID,npc_EXE,read_data_1_EXE,read_data_2_EXE,imm_EXE,reg_dest1_EXE,reg_dest2_EXE,jump_addr_EXE,rs,Regwrite_EXE,MemtoReg_EXE,Branch_EXE,MeanRead_EXE,MeanWrite_EXE,RegDst_EXE,ALUOp_EXE,ALUSrc_EX,Jump_sel_EXE);

Execution_stage:ex_stage_wth_pr port map(clk,jump_addr_EXE,Jump_sel_EXE,Regwrite_EXE,MemtoReg_EXE,Branch_EXE,MeanWrite_EXE,MeanRead_EXE,RegDst_EXE,ALUOp_EXE,ALUSrc_EX,npc_EXE,mux1_to_exe_stage,mux2_to_exe_stage,imm_EXE,reg_dest1_EXE,reg_dest2_EXE,RegWrite_MEM,MemtoReg_MEM,Jump_sel_MEM,Branch_MEM,MeanWrite_MEM,MeanRead_MEM,eff_addr_IF,Zero_out_MEM,result_MEM,read_data_2_MEM,output_reg_dest_MEM);
  
Add_gate_eff_addr:and_gate port map(Branch_MEM,Zero_out_MEM,gate_to_mux);   

add_gate_mux_to_sel_j_jr_b: and_gate_mux port map(Jump_sel_MEM,gate_to_mux,PCSrc);

Memory_stage:mem_stage port map(clk,result_MEM,read_data_2_MEM,output_reg_dest_MEM,RegWrite_MEM,MemtoReg_MEM,MeanWrite_MEM,MeanRead_MEM,result_WB,read_data_WB,Write_reg_ID,RegWrite_ID,MemtoReg_WB);
  
Writeback_stage:writeback port map(read_data_WB,result_WB,MemtoReg_WB,Write_data_ID);
  
  
forwarding_unit1:forwarding_unit_alu_alu port map(rs,reg_dest1_EXE,output_reg_dest_MEM,sel1,sel2);  
mux_rs_forwarding:mux_2_1 port map(read_data_1_EXE,result_MEM,sel1,mux1_to_exe_stage);
mux_rt_forwarding:mux_2_1 port map(read_data_2_EXE,result_MEM,sel2,mux2_to_exe_stage);



end behaviour; 




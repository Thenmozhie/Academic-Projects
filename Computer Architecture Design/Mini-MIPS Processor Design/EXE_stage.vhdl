library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;




entity ex_stage_wth_pr is
        port(
           clk: in std_logic;
           
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
end ex_stage_wth_pr;







architecture behaviour of ex_stage_wth_pr is
  
  


component alu is 
port( a:in std_logic_vector(31 downto 0);
    b:in std_logic_vector(31 downto 0);
          ALUOp: in std_logic_vector(2 downto 0);
               result:out std_logic_vector(31 downto 0));
end component;

component mux_2_1 is 
port( a:in std_logic_vector(31 downto 0);
      b:in std_logic_vector(31 downto 0);
               s:in std_logic;
               o:out std_logic_vector(31 downto 0));
end component; 


component mux_RegDst is 
port( a:in std_logic_vector(4 downto 0);
      b:in std_logic_vector(4 downto 0);
               s:in std_logic;
               o:out std_logic_vector(4 downto 0));
end component;


component mux_3_1 is 
port( a:in std_logic_vector(31 downto 0);
             b:in std_logic_vector(31 downto 0);
            c:in std_logic_vector(31 downto 0);
               s:in std_logic_vector(1 downto 0);
               o:out std_logic_vector(31 downto 0));
end component;


component adder_wth_shift is 
port( npc:in std_logic_vector(31 downto 0);
            imm:in std_logic_vector(31 downto 0);
               add_result:out std_logic_vector(31 downto 0));
end component; 


component adder_jr is 
port( npc:in std_logic_vector(31 downto 0);
            rs:in std_logic_vector(31 downto 0);
               add_result:out std_logic_vector(31 downto 0));
end component; 

component j_instruction_addr is 
port( npc:in std_logic_vector(31 downto 0);
            jump:in std_logic_vector(25 downto 0);
               addr:out std_logic_vector(31 downto 0));
end component; 


component zero_detector is 
port(result:in std_logic_vector(31 downto 0);
             Zero_out:out std_logic);
end component; 


component ex_mem_pr is 
port( clk:in std_logic;
           
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
end component;   
    
  
signal mux_to_alu: std_logic_vector(31 downto 0);

signal b_addr:std_logic_vector(31 downto 0);
signal jr_addr:std_logic_vector(31 downto 0);
signal j_addr:std_logic_vector(31 downto 0);

signal mux_for_b_j_jr_out:std_logic_vector(31 downto 0);

signal Zero_out_in:std_logic;
signal result_in:std_logic_vector(31 downto 0);
signal output_reg_dst_in: std_logic_vector(4 downto 0);


begin  
  
  
  
adder_with_shift: adder_wth_shift port map(npc,imm,b_addr);  
  
mux_for_alu: mux_2_1 port map(read_data_2,imm,ALUSrc,mux_to_alu);  

alu_operation: alu port map(read_data_1,mux_to_alu,ALUOp,result_in);

zero_dectection: zero_detector port map(result_in,Zero_out_in);  
  
mux_for_reg_des:mux_RegDst port map(rt,rd,RegDst,output_reg_dst_in);
  
  
adder_for_jr:adder_jr port map(npc,read_data_1,jr_addr);

j_instruction_address:j_instruction_addr port map(npc,jump_addr,j_addr);

mux_for_b_j_jr:mux_3_1 port map(j_addr,jr_addr,b_addr,sel_decision,mux_for_b_j_jr_out);
  

ex_mem_prx: ex_mem_pr port map(clk,RegWrite,MemtoReg,Branch,MeanWrite,MeanRead,mux_for_b_j_jr_out,Zero_out_in,result_in,read_data_2,output_reg_dst_in,sel_decision, RegWrite_out,MemtoReg_out,Branch_out,MeanWrite_out,MeanRead_out,add_result_out,Zero_out_out,result_out,read_data_2_out,sel_decision_out,output_reg_dst_out); 
  
  
  
  
  
end behaviour;  
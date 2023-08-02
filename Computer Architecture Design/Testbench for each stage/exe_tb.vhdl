library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity exe_tb is
end exe_tb;


architecture beh of exe_tb is




component ex_stage_wth_pr port (clk: in std_logic;
           
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
                                 
                                 
           Branch_out:out std_logic;
           MeanWrite_out: out std_logic;
           MeanRead_out:out std_logic;
                                 
           add_result_out: out std_logic_vector(31 downto 0);
           Zero_out_out:out std_logic;
           result_out:out std_logic_vector(31 downto 0);
           read_data_2_out: out std_logic_vector(31 downto 0);
           output_reg_dst_out: out std_logic_vector(4 downto 0));
end component;



signal jump_addr_t:std_logic_vector(25 downto 0):=(others=>'0');
signal sel_decision_t: std_logic_vector(1 downto 0):=(others=>'0'); ----for J,JR,B-----
           
signal RegWrite_t:std_logic:='0';
signal MemtoReg_t:std_logic:='0';
                      
                      
signal Branch_t:std_logic:='0';
signal MeanWrite_t: std_logic:='0';
signal MeanRead_t:std_logic:='0';
           
signal RegDst_t:std_logic:='0';
signal ALUOp_t: std_logic_vector(2 downto 0):=(others=>'0');
signal ALUSrc_t:std_logic:='0';           
           
signal npc_t:std_logic_vector(31 downto 0):=(others=>'0');
signal read_data_1_t: std_logic_vector(31 downto 0):=(others=>'0');
signal read_data_2_t: std_logic_vector(31 downto 0):=(others=>'0');
signal imm_t:std_logic_vector(31 downto 0):=(others=>'0');
signal rt_t:std_logic_vector(4 downto 0):=(others=>'0');
signal rd_t:std_logic_vector(4 downto 0):=(others=>'0');
           
           
           
signal RegWrite_out_t: std_logic:='0';
signal MemtoReg_out_t:std_logic:='0';
                                 
                                 
signal Branch_out_t:std_logic:='0';
signal MeanWrite_out_t: std_logic:='0';
signal MeanRead_out_t:std_logic:='0';
                                 
signal add_result_out_t: std_logic_vector(31 downto 0):=(others=>'0');
signal Zero_out_out_t:std_logic:='0';
signal result_out_t:std_logic_vector(31 downto 0):=(others=>'0');
signal read_data_2_out_t: std_logic_vector(31 downto 0):=(others=>'0');
signal output_reg_dst_out_t: std_logic_vector(4 downto 0):=(others=>'0');





signal test_clk:std_logic;
constant clk_period:time:=10ns;

begin
   
with_tb: ex_stage_wth_pr port map(test_clk,jump_addr_t, sel_decision_t,RegWrite_t,MemtoReg_t,Branch_t,MeanWrite_t,MeanRead_t,RegDst_t,ALUOp_t,ALUSrc_t,npc_t,read_data_1_t,read_data_2_t,imm_t,rt_t,rd_t,RegWrite_out_t,MemtoReg_out_t,Branch_out_t,MeanWrite_out_t,MeanRead_out_t,add_result_out_t,Zero_out_out_t,result_out_t,read_data_2_out_t,output_reg_dst_out_t);
  
  

clk_process:process
begin
  test_clk<='0';
  wait for clk_period/2;
  test_clk<='1';
  wait for clk_period/2;
end process;


process
begin
  
  jump_addr_t<="01000100010000000000001001";
  sel_decision_t<="00"  ;
  
  RegWrite_t<='0';
  MemtoReg_t<='0';
  Branch_t<='0';
  MeanWrite_t<='0';
  MeanRead_t<='0';
    
  RegDst_t<='0';
  ALUOp_t<="110";
  ALUSrc_t<='1';
  npc_t<="00000000000000000000000000000100";                 ------I type-------
  read_data_1_t<="01010101010101010101010101010101";
  read_data_2_t<="00000000000000000000000000000100";      ------ NORI, o/p:00000000000000000000000000000000
  imm_t<="11111111111111111111111111111111";
  rt_t<="00100";
  rd_t<="01000";
  wait for clk_period;
  
  
  jump_addr_t<="01000100010000000000001001";
    sel_decision_t<="00"  ;
    
    RegWrite_t<='0';
    MemtoReg_t<='0';
    Branch_t<='0';
    MeanWrite_t<='0';
    MeanRead_t<='0';
      
    RegDst_t<='1';
    ALUOp_t<="010";
    ALUSrc_t<='0';
    npc_t<="00000000000000000000000000000100";                 ------R type-------
    read_data_1_t<="00000000000000000000000000000110";
    read_data_2_t<="01010101010101010101010101010101";      ------ SRL, o/p: 00000001010101010101010101010101 
    imm_t<="11111111111111111111111111111111";
    rt_t<="00100";
    rd_t<="01000";
    wait for clk_period; 
    
    
    
    jump_addr_t<="01000100010000000000001001";
      sel_decision_t<="00"  ;
      
      RegWrite_t<='0';
      MemtoReg_t<='0';
      Branch_t<='0';
      MeanWrite_t<='0';
      MeanRead_t<='0';
        
      RegDst_t<='1';
      ALUOp_t<="100";
      ALUSrc_t<='0';
      npc_t<="00000000000000000000000000000100";                 ------R type-------
      read_data_1_t<="01010101010101010101010101010101";
      read_data_2_t<="10101010101010101010101010101010";      ------ XOR, o/p: 11111111111111111111111111111111
      imm_t<="11111111111111111111111111111111";
      rt_t<="00100";
      rd_t<="01000";
      wait for clk_period; 
      
      
      
      jump_addr_t<="01000100010000000000001001";
            sel_decision_t<="00"  ;
            
            RegWrite_t<='0';
            MemtoReg_t<='0';
            Branch_t<='0';
            MeanWrite_t<='0';
            MeanRead_t<='0';
              
            RegDst_t<='0';
            ALUOp_t<="111";
            ALUSrc_t<='1';
            npc_t<="00000000000000000000000000000100";                 ------I type-------
            read_data_1_t<="11110000111100001111000011110000";
            read_data_2_t<="11111111111111111111111111111111";      ------ NANDI, o/p:  00001111000011110000111100001111 now getting, changed not com(b) 
            imm_t<="11110000111100001111000011110000";
            rt_t<="00100";
            rd_t<="01000";
            wait for clk_period;
            
            
            jump_addr_t<="01000100010000000000001001";
              sel_decision_t<="00"  ;
                        
                        RegWrite_t<='0';
                        MemtoReg_t<='0';
                        Branch_t<='0';
                        MeanWrite_t<='0';
                        MeanRead_t<='0';
                          
                        RegDst_t<='0';
                        ALUOp_t<="011";
                        ALUSrc_t<='0';
                        npc_t<="00000000000000000000000000000100";                 ------R type-------
                        read_data_1_t<="00000000000000000000000000011111";
                        read_data_2_t<="00000000000000000000000000001111";      ------ SUBU, o/p:  00000000000000000000000000010000 
                        imm_t<="11111111111111111111111111111111";
                        rt_t<="00100";
                        rd_t<="01000";
                        wait for clk_period;
                        
      
      jump_addr_t<="01000100010000000000001001";
                    sel_decision_t<="00"  ;
                              
                              RegWrite_t<='0';
                              MemtoReg_t<='0';
                              Branch_t<='0';
                              MeanWrite_t<='0';
                              MeanRead_t<='0';
                                
                              RegDst_t<='0';
                              ALUOp_t<="000";
                              ALUSrc_t<='1';
                              npc_t<="00000000000000000000000000000100";                 ------I type-------
                              read_data_1_t<="00000000000000000000000000011111";
                              read_data_2_t<="11111111111111111111111111111111";      ------ ADDI, o/p:  00000000000000000000000000101110
                              imm_t<="00000000000000000000000000001111";
                              rt_t<="00100";
                              rd_t<="01000";
                              wait for clk_period;  
                              
                              
                              
                              
    jump_addr_t<="01000100010000000000001001";
     sel_decision_t<="00"  ;
                                                            
     RegWrite_t<='0';
     MemtoReg_t<='0';
     Branch_t<='0';
     MeanWrite_t<='0';
     MeanRead_t<='0';
                                                              
    RegDst_t<='0';
     ALUOp_t<="001";
    ALUSrc_t<='0';
     npc_t<="00000000000000000000000000000100";                 ------I type-------
      read_data_1_t<="00000000000000000000000000011111";
      read_data_2_t<="11111111111111111111111111111111";      ------ BEQ, if not equal o/p:  
      imm_t<="00000000000000000000000000001111";
      rt_t<="00100";
      rd_t<="01000";
      wait for clk_period;
      
      
      
      jump_addr_t<="01000100010000000000001001";
          sel_decision_t<="00"  ;
                                                                 
          RegWrite_t<='0';
          MemtoReg_t<='0';
          Branch_t<='0';
          MeanWrite_t<='0';
          MeanRead_t<='0';
                                                                   
         RegDst_t<='0';
          ALUOp_t<="001";
         ALUSrc_t<='0';
          npc_t<="00000000000000000000000000000100";                 ------I type-------
           read_data_1_t<="00000000000000000000000000011111";
           read_data_2_t<="00000000000000000000000000011111";      ------ BEQ, if equal o/p:    eff addr=00000000000000000000000001000000
           imm_t<="00000000000000000000000000001111";
           rt_t<="00100";
           rd_t<="01000";
           wait for clk_period;  
                       
           
           
           jump_addr_t<="01000100010000000000001001";
            sel_decision_t<="01"  ;
                                                                   
            RegWrite_t<='0';
            MemtoReg_t<='0';
            Branch_t<='0';
            MeanWrite_t<='0';
            MeanRead_t<='0';
                                                                     
           RegDst_t<='0';
            ALUOp_t<="000";
           ALUSrc_t<='0';
            npc_t<="00000000000000000000000000000100";                 ------I type-------
             read_data_1_t<="00000000000000000000000000011111";
             read_data_2_t<="11111111111111111111111111111111";      ------ LH, SW 00000000000000000000000000101110 
             imm_t<="00000000000000000000000000001111";
             rt_t<="00100";
             rd_t<="01000";
             wait for clk_period;                            
                        
                        
                        
                        
           jump_addr_t<="01000100010000000000001001";
            sel_decision_t<="01"  ;
                                                                   
            RegWrite_t<='0';
            MemtoReg_t<='0';
            Branch_t<='0';
            MeanWrite_t<='0';
            MeanRead_t<='0';
                                                                     
           RegDst_t<='0';
            ALUOp_t<="000";
           ALUSrc_t<='0';
            npc_t<="00000000000000000000000000000100";                 ------R type-------
             read_data_1_t<="00000000000000000000000000011111";
             read_data_2_t<="11111111111111111111111111111111";      ------ JR 00000000000000000000000000101110 
             imm_t<="00000000000000000000000000001111";
             rt_t<="00100";
             rd_t<="01000";
             wait for clk_period;
             
             
              
             
             jump_addr_t<="01000100010000000000001001";
            sel_decision_t<="10"  ;
                                                                   
            RegWrite_t<='0';
            MemtoReg_t<='0';
            Branch_t<='0';
            MeanWrite_t<='0';
            MeanRead_t<='0';
                                                                     
           RegDst_t<='0';
            ALUOp_t<="000";
           ALUSrc_t<='0';
            npc_t<="00000000000000000000000000000100";                 ------J type-------
             read_data_1_t<="00000000000000000000000000011111";
             read_data_2_t<="11111111111111111111111111111111";      ------ J 00000000000000000000000000101110 
             imm_t<="00000000000000000000000000001111";
             rt_t<="00100";
             rd_t<="01000";
             wait for clk_period; 
      
    
  

end process;

end beh;


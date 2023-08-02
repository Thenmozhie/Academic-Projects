library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlunit is
  port(clk:in std_logic;
        Inst : in std_logic_vector (31 downto 0);
        
        ALUOp : out std_logic_vector(2 downto 0);
        RegDst, ALUsrc, Branch, MemRead, MemWrite, RegWrite, MemtoReg: out std_logic;  
        Jump : out std_logic_vector(1 downto 0);
        sel_shamt : out std_logic
  );
end controlunit;

architecture beh of controlunit is

begin


ControlLogic: process (Inst,clk)
begin
if rising_edge(clk) then

if (Inst(31 downto 26)= "100001") then         --I-TYPE --load half-- 


-- EX Stage ---
ALUsrc<='1';
ALUOp <= "101";
RegDst <='0'; 

       

--Mem Stage Control lines  
Branch <='0';
MemRead <='1';
MemWrite <='0';

--WB Stage control lines
RegWrite <='1';
MemtoReg <= '0';        
Jump <= "00";

--SRL control line for shift operation
sel_shamt <= '0';

elsif (Inst(31 downto 26) = "101011") then      --I TYPE --Store Word --


-- EX Stage ---
ALUsrc<='1';
ALUOp <= "101";
RegDst <='0';      

--Mem Stage Control lines  
Branch <='0';
MemRead <='0';
MemWrite <='1';

--WB Stage control lines   
RegWrite <='0';
MemtoReg <= '0';        --don't care
Jump <= "00";

--SRL control line for shift operation
sel_shamt <= '0';
 

elsif (Inst(31 downto 26)= "000100") then    --  I TYPE -- BEQ  

-- EX Stage ---

ALUsrc<='0'; 
ALUOp <= "001";     
RegDst<='0';         --don't care 

--Mem Stage Control lines  
Branch <='1';
MemRead <='0';
MemWrite <='0';

--WB Stage control lines
RegWrite <='0';           
MemtoReg <= '0';          --don't care
Jump <= "00";

--SRL control line for shift operation
sel_shamt <= '0';


elsif(Inst(31 downto 26)= "001000") then       -- I TYPE -- ADDI 

-- EX Stage ---
ALUsrc <='1'; 
ALUOp <= "000";     
RegDst <='0';      

--Mem Stage Control lines  
Branch <='0';
MemRead <='0';
MemWrite <='0';

--WB Stage control lines
RegWrite <='1';
MemtoReg <= '1';
Jump <= "00";

--SRL control line for shift operation
sel_shamt <= '0';


elsif (Inst(31 downto 26)= "000000") then       -- R TYPE  -- SUBU
    if (Inst(5 downto 0)= "100011") then 
    -- EX Stage ---
    ALUsrc <='0';     
    ALUOp <= "011";
    RegDst <='1';     

    --Mem Stage Control lines  
    Branch <='0';
    MemRead <='0';
    MemWrite <='0';

    --WB Stage control lines
    RegWrite <='1';
    MemtoReg <= '1';
    Jump <= "00";

    --SRL control line for shift operation
    sel_shamt <= '0';
    
    
    elsif (Inst(5 downto 0)= "100110") then      -- R TYPE  -- XOR
    -- EX Stage ---
    ALUsrc <='0';     
    ALUOp <= "100";
    RegDst <='1';     
    
    --Mem Stage Control lines  
    Branch <='0';
    MemRead <='0';
    MemWrite <='0';
    
    --WB Stage control lines
    RegWrite <='1';
    MemtoReg <= '1';
    Jump <= "00";
    
    --SRL control line for shift operation
    sel_shamt <= '0';
    
    
    elsif (Inst(5 downto 0)= "000010") then    -- R TPE ---SRL
      
    -- EX Stage ---
    ALUsrc <='0';     
    ALUOp <= "010";
    RegDst <='1';     
    
    --Mem Stage Control lines  
    Branch <='0';
    MemRead <='0';
    MemWrite <='0';
    
    --WB Stage control lines
    RegWrite <='1';
    MemtoReg <= '1';
    Jump <= "00";
    
    --SRL control line for shift operation
    sel_shamt <= '1';
    
    
    elsif (Inst(5 downto 0)= "001000") then   --- R TYPE ---JR
    -- EX Stage ---
    ALUsrc <='0';    --don't care 
    ALUOp <= "000";  --don't care 
    RegDst <='0';    --don't care 
    
    --Mem Stage Control lines  
    Branch <='0';
    MemRead <='0'; --don't care 
    MemWrite <='0'; --don't care 
    
    --WB Stage control lines
    RegWrite <='0';
    MemtoReg <= '0'; --don't care 
    Jump <= "01"; 
    
    --SRL control line for shift operation
    sel_shamt <= '0';   
    
    
    else
      
      null;
    
    end if;

elsif(Inst(31 downto 26)= "001100") then       -- I TYPE -- NANDI 

-- EX Stage ---
ALUsrc <='1'; 
ALUOp <= "111";     
RegDst <='0';      

--Mem Stage Control lines  
Branch <='0';
MemRead <='0';
MemWrite <='0';

--WB Stage control lines
RegWrite <='1';
MemtoReg <= '1';
Jump <= "00";

--SRL control line for shift operation
sel_shamt <= '0';

--elsif (Inst(31 downto 26)= "000000") then       -- R TYPE  -- XOR
 --   if (Inst(5 downto 0)= "100110") then
-- EX Stage ---
--ALUsrc <='0';     
--ALUOp <= "100";
--RegDst <='1';     

--Mem Stage Control lines  
--Branch <='0';
--MemRead <='0';
--MemWrite <='0';

--WB Stage control lines
--RegWrite <='1';
--MemtoReg <= '0';
--Jump <= "00";

--SRL control line for shift operation
--sel_shamt <= '0';
 --   end if;

--elsif (Inst(31 downto 26)= "000000") then       -- R TYPE  -- SRL
 --   if (Inst(5 downto 0)= "000010") then 
  
-- EX Stage ---
--ALUsrc <='0';     
--ALUOp <= "010";
--RegDst <='1';     

--Mem Stage Control lines  
--Branch <='0';
--MemRead <='0';
--MemWrite <='0';

--WB Stage control lines
--RegWrite <='1';
--MemtoReg <= '0';
--Jump <= "00";

----SRL control line for shift operation
--sel_shamt <= '1';
  --  end if;
    
elsif(Inst(31 downto 26)= "001101") then       -- I TYPE -- NORI 

-- EX Stage ---
ALUsrc <='1'; 
ALUOp <= "110";     
RegDst <='0';      

--Mem Stage Control lines  
Branch <='0';
MemRead <='0';
MemWrite <='0';

--WB Stage control lines
RegWrite <='1';
MemtoReg <= '1';
Jump <= "00";

--SRL control line for shift operation
sel_shamt <= '0';

--elsif (Inst(31 downto 26)= "000000") then       -- R TYPE  -- JR
 --   if (Inst(5 downto 0)= "001000") then 
-- EX Stage ---
--ALUsrc <='0';    --don't care 
--ALUOp <= "000";  --don't care 
--RegDst <='0';    --don't care 

--Mem Stage Control lines  
--Branch <='0';
--MemRead <='0'; --don't care 
--MemWrite <='0'; --don't care 

--WB Stage control lines
--RegWrite <='1';
--MemtoReg <= '0'; --don't care 
--Jump <= "01"; 

--SRL control line for shift operation
--sel_shamt <= '0';
 --   end if;
elsif (Inst(31 downto 26)= "000010") then        -- J TYPE --Jump 

-- EX Stage ---
ALUsrc <='0'; 
ALUOp <= "000";   -- don't care     
RegDst<='0';      --don't care

--Mem Stage Control lines  
Branch <='0';
MemRead <='0';   
MemWrite <='0';  

--WB Stage control lines
RegWrite <='0';
MemtoReg <= '0';  --don't care 
Jump<= "10";   

--SRL control line for shift operation
sel_shamt <= '0';

else
  
  null;

end if;
end if;

end process;

end beh; 
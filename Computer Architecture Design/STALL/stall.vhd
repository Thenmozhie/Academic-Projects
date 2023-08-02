library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Stall_unit is
  port(
        Branch_id: in std_logic;  
        Jump_id : in std_logic_vector(1 downto 0);
        
        Branch_exe: in std_logic;  
       Jump_exe : in std_logic_vector(1 downto 0);
       
      Branch_mem: in std_logic;  
      Jump_mem : in std_logic_vector(1 downto 0);
      
add_in : in std_logic_vector(31 downto 0);
add_out : out std_logic_vector(31 downto 0);
inst:in std_logic_vector(31 downto 0);
inst_out : out std_logic_vector(31 downto 0);
       
  );
end stall_unit;

architecture beh of stall_unit is

begin
process (Branch_id,Jump_id,Branch_exe,Jump_exe,Branch_mem,Jump_mem)
begin
if (Branch_id = '1' or Jump_id = "01" or Jump_id = "10" or Branch_exe = '1' or Jump_exe = "01" or Jump_exe = "10" or Branch_exe = '1' or Jump_mem = "01" or Jump_mem = "10" )
add_out <= "00000000000000000000000000000000";
inst_out <= "00000000000000000000000000000000";
else
add_out <= add_in;
inst_out <= inst;
end if;

end process;

end beh;
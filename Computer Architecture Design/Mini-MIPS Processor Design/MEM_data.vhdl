--VHDL code for Memory stage
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity data_mem is

generic 
    (
        mem_depth : integer := 1024    -- depth of the data memory
    );

port
  (
  clk:in std_logic;
  --reset: in std_logic;
  ex_result_out, ex_read_data_2_out:in std_logic_vector(31 downto 0);	  
  MeanWrite,MeanRead: in std_logic;
  --result_mem_out,
  read_data:out std_logic_vector(31 downto 0)
  );
       
end data_mem;


architecture beh of data_mem is 

type mem_size is array (0 to mem_depth-1) of std_logic_vector(31 downto 0);
signal mem : mem_size;
begin
    process (clk)
    begin
        --if reset = '1' then
            --mem <= (others => (others => '0'));
         mem(9)<="00000000000000000000000000110110";   
         mem(54)<="00000000000000000000000000001001";   
            
        if rising_edge(clk) then
            if MeanWrite = '1' then
                mem(to_integer(unsigned(ex_result_out(31 downto 0)))) <= ex_read_data_2_out;
        --result_mem_out <= ex_result_out;
            end if;
            
            
        elsif falling_edge(clk) then
            if MeanRead = '1' then
                read_data <= mem(to_integer(unsigned(ex_result_out(31 downto 0))));
        --result_mem_out <= ex_result_out;
            end if;
        end if;
    end process;

end Beh;

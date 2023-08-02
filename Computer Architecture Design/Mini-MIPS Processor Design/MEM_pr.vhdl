--vhdl code for memmory/writeback buffer
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mw_buffer is
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
end mw_buffer;
architecture beh of mw_buffer is

begin

  process(clk)

  begin

    if(rising_edge(clk)) then
    
      RegWrite_out <= RegWrite;
      MemtoReg_out <= MemtoReg;
      result_mem_out <= result_mem;
      read_data_out <= read_data;
      output_reg_dst_out <= output_reg_dst;
      
    end if;

  end process;   

end Beh;
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity writeback is
port(
  read_data: in std_logic_vector(31 downto 0);
  alu_out: in std_logic_vector(31 downto 0);
  MemtoReg: in std_logic;
  wb_out:out std_logic_vector(31 downto 0));
end writeback;

architecture behavioral of writeback is
begin
  process(MemtoReg,alu_out,read_data)
  begin
    if MemtoReg = '1' then
      wb_out <= alu_out;
    else
      wb_out <= read_data;
  end if;
end process;

end behavioral;
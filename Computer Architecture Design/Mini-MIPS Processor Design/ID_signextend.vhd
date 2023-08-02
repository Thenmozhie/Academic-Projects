--VHDL code for sign extended in decode stage
library ieee;
use ieee.std_logic_1164.all;

entity sign_ext is
  port (
    input_imm  : in  std_logic_vector(15 downto 0);
    output_imm : out std_logic_vector(31 downto 0)
  );
end sign_ext;

architecture beh of sign_ext is
begin
  process(input_imm)
  begin
    ---if rising_edge(clk) then
    if input_imm(15) = '1' then  -- sign bit is 1
      output_imm <= "1111111111111111" & input_imm;  -- sign extending by '1' if the most significant bit is '1'
    else  
      output_imm <= "0000000000000000" & input_imm;  -- sign extending by '0' if the most significant bit is '0'
    end if;
  --end if;
  end process;
end beh;
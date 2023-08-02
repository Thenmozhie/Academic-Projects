--VHDL code for register in decode stage
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file is
	generic
	(
	reg_depth: integer := 10240
	);
    port (
        clk: in std_logic;
        RegWrite: in std_logic;
        write_reg: in std_logic_vector(4 downto 0);
        write_data: in std_logic_vector(31 downto 0);
        read_reg_1: in std_logic_vector(4 downto 0);
        read_reg_2: in std_logic_vector(4 downto 0);
        read_data_1: out std_logic_vector(31 downto 0);
        read_data_2: out std_logic_vector(31 downto 0)
    );
end reg_file;

architecture rtl of reg_file is
    type reg_size is array (0 to reg_depth-1) of std_logic_vector(31 downto 0);
    signal reg: reg_size;
    signal half_write_data: std_logic_vector(31 downto 0);
begin
    process (clk)
    begin
      
        
        reg(0) <= "00000000000000000000000000000000";
        reg(2) <= "00000000000000000000000000110110";
        reg(5) <= "00000000000000000000000000001001";
        reg(6) <= "00000000000000000010001111111010";
        reg(7) <= "00000000000000000000000000001010";
        reg(8) <= "00000000000000000000000001100100";
        reg(9) <= "00000000000000000000000000000101";
        reg(12) <= "00000000000000000000000000010101";
        reg(13) <= "00000000000000000000000000010100";
        reg(14) <= "00000000000000000000000010111100";
        reg(19) <= "00000000000000000000000000000101";
        reg(23) <= "00000000000000000100001100110101";
        
        
        
        if rising_edge(clk) then
            if RegWrite = '1' then
                  
               half_write_data<="0000000000000000" & write_data(15 downto 0);
               reg(to_integer(unsigned(write_reg))) <= std_logic_vector(half_write_data);
            end if;
    
        elsif falling_edge(clk) then
        
          ----elsif RegWrite = '0' then
            read_data_1 <= std_logic_vector(reg(to_integer(unsigned(read_reg_1))));
            read_data_2 <= std_logic_vector(reg(to_integer(unsigned(read_reg_2))));
            
         ---endif; 
                      ---if RegWrite = '1' then
                              
                          ---  half_write_data<="0000000000000000" & write_data(15 downto 0);
                          ---  reg(to_integer(unsigned(write_reg))) <= std_logic_vector(half_write_data);
                       ---- end if;
            
    end if;
    end process;
end architecture rtl;
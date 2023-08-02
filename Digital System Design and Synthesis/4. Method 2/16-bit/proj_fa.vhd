library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity proj_fa is
  generic(width : natural :=16);
  
  port (
    x     : in std_logic_vector(width-1 downto 0);
    y     : in std_logic_vector(width-1 downto 0);
    cin   : in std_logic;
    s     : out std_logic_vector(width-1 downto 0);
    cout  : out std_logic
    );
end proj_fa ;
 
architecture proj_fa_arch of proj_fa is
  signal c : std_logic_vector(width - 1 downto 0);
begin
gen_fa :
for i in (width - 1) downto 0 generate  
  lower_bit : if (i = 0) generate
            s(i)    <= x(i) xor y(i) xor cin;
            c(i)    <= (x(i) and y(i)) or ((x(i) xor y(i)) and cin);
         end generate lower_bit;
         upper_bit : if (i > 0) generate 
          s(i)    <= x(i) xor y(i) xor c(i-1);
          c(i) <= (x(i) and y(i)) or ((x(i) xor y(i)) and c(i-1));
        end generate upper_bit;
      end generate gen_fa;
        
  
  
  
  --process(x,y,cin)
    --begin
      --for i in (width - 1) downto 0 loop
        --if (i = 0) then
           -- s(i)    <= x(i) xor y(i) xor cin;
            --c(i)    <= (x(i) and y(i)) or ((x(i) xor y(i)) and cin);
        --else
          --s(i)    <= x(i) xor y(i) xor c(i-1);
          --c(i) <= (x(i) and y(i)) or ((x(i) xor y(i)) and c(i-1));
        --end if;
    --end loop;
    cout <= c(width-1);
  --end process;
  
end proj_fa_arch;

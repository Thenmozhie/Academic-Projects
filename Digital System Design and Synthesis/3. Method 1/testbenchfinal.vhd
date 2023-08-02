--Wallace Multiplier 
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_wallace_multiplier is 
end test_wallace_multiplier; 
architecture testbench of test_wallace_multiplier is 
component multiplier3 
port( A,B: in std_logic_vector(7 downto 0); 
Z: out std_logic_vector(23 downto 0)); 
end component; 

signal A,B: std_logic_vector(7 downto 0); 
signal Z:std_logic_vector(23 downto 0); 
begin 
u1: multiplier3 port map(A(7 downto 0),B(7 downto 0),Z(23 downto 0)); 
process

begin 
A<="00000000"; 
B<="00000000"; 
wait for 100 ns; 
A<="00000010"; 
B<="00000010"; 
wait for 100 ns; 
end process; 
end testbench; 

--xor 
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_xor is 
end test_xor; 
architecture testbench of test_xor is 
signal a,b: std_logic; 
signal c:std_logic; 
component xor1 
port(A,B: in std_logic; 
Z: out std_logic); 
end component; 
begin 
u1: xor1 port map(a,b,c); 
process 
begin 
a<='0'; 
b<='0'; 
wait for 100 ns; 
a<='0'; 
b<='1'; 
wait for 100 ns; 
a<='1'; 
b<='0'; 
wait for 100 ns; 
a<='1'; 
b<='1'; 
wait for 100 ns; 
end process; 
end testbench; 

--or  
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_or is 
end test_or; 
architecture testbench of test_or is 
signal a,b: std_logic; 
signal c:std_logic;
component or1 
port(A,B: in std_logic; 
Z: out std_logic); 
end component; 
begin 
u1: or1 port map(a,b,c); 
process 
begin 
a<='0'; 
b<='0'; 
wait for 100 ns; 
a<='0'; 
b<='1'; 
wait for 100 ns; 
a<='1'; 
b<='0'; 
wait for 100 ns; 
a<='1'; 
b<='1'; 
wait for 100 ns; 
end process; 
end testbench; 

--not 
library ieee; 
use ieee.std_logic_1164.all; 
entity test_not is 
end test_not; 
architecture structural of test_not is 
component not_gate 
port(A:in std_logic; 
Z:out std_logic); 
end component; 
signal a,b: std_logic; 
begin 
u1: not_gate port map(a,b); 
process 
begin 
a<='0'; 
wait for 100 ns; 
a<='1'; 
wait for 100 ns; 
end process; 
end structural; 

--full 
library ieee; 
use ieee.std_logic_1164.all; 
entity test_fulladder is
end test_fulladder; 
architecture testbench of test_fulladder is 
signal d,e,f: std_logic; 
signal s1,c1: std_logic; 
component full_adder1 is 
port(A,B,carry_in:in std_logic; 
sum,carry_out: out std_logic); 
end component; 
begin 
g1:full_adder1 port map(d,e,f,s1,c1); 
process 
begin 
d<='0'; 
e<='0'; 
f<='0'; 
wait for 100 ns; 
d<='0'; 
e<='0'; 
f<='1'; 
wait for 100 ns; 
d<='0'; 
e<='1'; 
f<='0'; 
wait for 100 ns; 
d<='0'; 
e<='1'; 
f<='1'; 
wait for 100 ns; 
d<='1'; 
e<='0'; 
f<='0'; 
wait for 100 ns; 
d<='1'; 
e<='0'; 
f<='1'; 
wait for 100 ns; 
d<='1'; 
e<='1'; 
f<='0'; 
wait for 100 ns; 
d<='1'; 
e<='1'; 
f<='1'; 
wait for 100 ns; 
end process; 
end testbench; 

--and 
library ieee;
use ieee.std_logic_1164.all; 
entity and_gate_test is 
end and_gate_test; 
architecture testbench of and_gate_test is 
signal a,b : std_logic ; 
signal c :std_logic ; 
component and1 
port(A,B: in std_logic; 
Z:out std_logic); 
end component; 
begin 
h1: and1 port map(a,b,c); 
process 
begin 
a<= '0'; 
b<='0'; 
wait for 100 ns; 
a<= '0'; 
b<='1'; 
wait for 100 ns; 
a<= '1'; 
b<='0'; 
wait for 100 ns; 
a<= '1'; 
b<='1'; 
wait for 100 ns; 
end process; 
end testbench; 

--8 bit 
library ieee; 
use ieee.std_logic_1164.all; 
entity test_8bitreg is 
end test_8bitreg; 
architecture testbench of test_8bitreg is 
signal data_in : STD_LOGIC_VECTOR (7 downto 0); 
signal clock,clear,load : STD_LOGIC; 
signal data_out : STD_LOGIC_VECTOR (7 downto 0); 
component reg_8_bit 
port(data_in :in std_logic_vector(7 downto 0); 
clock,clear,load:in std_logic; 
data_out:out std_logic_vector(7 downto 0)); 
end component; 
begin 
u1: reg_8_bit port map(data_in,clock,clear,load,data_out); 
process 
begin

data_in<="00000000"; 
clock<='1'; 
clear<='0'; 
load<='0'; 
wait for 100 ns; 

data_in<="00000001"; 
clock<= '1'; 
clear<='0'; 
load<='0'; 
wait for 100 ns; 

data_in<="00001111"; 
clock<='1'; 
clear<='0'; 
load<='0'; 
wait for 100 ns; 
end process; 
end testbench; 

--half 
library ieee; 
use ieee.std_logic_1164.all; 
entity test_halfadder is 
end test_halfadder; 
architecture testbench of test_halfadder is 
signal ha,hb: std_logic; 
signal hsum,hcarry: std_logic; 
component half_adder1 
port(A,B:in std_logic; 
sum,carry: out std_logic); 
end component; 
begin 
e1:half_adder1 port map (ha,hb,hsum,hcarry); 
process 
begin 
ha<= '0'; 
hb<='0'; 
wait for 100 ns; 
ha<= '0'; 
hb<='1'; 
wait for 100 ns; 
ha<= '1'; 
hb<='0'; 
wait for 100 ns; 
ha<= '1'; 
hb<='1'; 
wait for 100 ns; 
end process;
end testbench;

--Final Code Test_Bench:
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture behavior of testbench is
component main3
port(A,B : in std_logic_vector(7 downto 0);
clock: in std_logic;
load: in std_logic;
clear: in std_logic;
Z: out std_logic_vector (23 downto 0);
end_flag: out std_logic);
end component;
signal clock1,clear1,load1: std_logic:= '0';
signal A1,B1: std_logic_vector (7 downto 0);
signal Z1: std_logic_vector (23 downto 0);
begin

tes : main3 port map(
A =>A1,
B =>B1,
clock=>clock1,
clear=>clear1,
load=>load1,
Z=>Z1);
clock1 <= not(clock1) after 500ns;
load1 <= '0' after 200ns, '1' after 300ns;
A1<="00000010";
B1<="00010000";
clear1 <= '1' after 100ns, '0' after 200ns;
end;


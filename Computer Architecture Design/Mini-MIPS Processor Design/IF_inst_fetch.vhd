--VHDL code for Instriction Fetch Module
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;  

entity inst_fetch is
 port(
 clk : in std_logic; 
 sel: in std_logic;
 mux2: in std_logic_vector(31 downto 0);
 inst: out  std_logic_vector(31 downto 0);
 add_out:out std_logic_vector (31 downto 0)
);
end inst_fetch;

architecture beh of inst_fetch is

--component declaration
component mux1
  port(
  s : in std_logic;
  a, b : in std_logic_vector(31 downto 0);
  mout : out std_logic_vector(31 downto 0)
    ); 
end component;

component add1
  port(a: in std_logic_vector(31 downto 0):=(others=>'0');
    addout1 : out std_logic_vector(31 downto 0):=(others=>'0')
    ); 
end component;

component pc_32
  port(clk : in std_logic;
        pc_in : in std_logic_vector(31 downto 0);
        pc_out : out std_logic_vector(31 downto 0)
    );
end component;

component inst_mem
  port(
    clk : in std_logic;
    pc: in std_logic_vector(31 downto 0);
    inst: out  std_logic_vector(31 downto 0)
  );
end component;

component IFbuffer
  port(
  
 clk: in std_logic;
 --enb: in std_logic;
 add_in: in std_logic_vector(31 downto 0);
 add_out: out std_logic_vector(31 downto 0);
 insti: in std_logic_vector(31 downto 0);
 insto: out std_logic_vector(31 downto 0)
  );

end component;
--Signal Declaration
signal m1,m4:std_logic_vector(31 downto 0);
signal pco,ins0:std_logic_vector(31 downto 0);
--signal m3 : std_logic;

begin

  
mux : mux1 port map (sel,m1,mux2,m4);
prcount: pc_32 port map (clk,m4,pco);
add4: add1 port map (pco,m1);
imem: inst_mem port map (clk,pco,ins0);
bufferout: IFbuffer port map (clk,m1,add_out,ins0,inst);

  
end beh;
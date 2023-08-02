library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;


entity proj_mult8 is
  port (
    a,b : in std_logic_vector(7 downto 0);
    z   : out std_logic_vector(15 downto 0)
  );
end proj_mult8;
  
architecture proj_mult8_arch of proj_mult8 is
  
component proj_csa
  generic(width : integer := 6);
port  (
x : in std_logic_vector (width - 1 downto 0); 
    y : in  std_logic_vector (width - 1 downto 0);
    z : in  std_logic_vector (width - 1 downto 0);
    s : out std_logic_vector (width - 1 downto 0);
    c : out std_logic_vector (width - 1 downto 0)
      );
  end component;
  
  component proj_fa
    generic(width : natural :=16);
  port (
  x     : in std_logic_vector(width-1 downto 0);
     y     : in std_logic_vector(width-1 downto 0);
     cin   : in std_logic;
     s     : out std_logic_vector(width-1 downto 0);
     cout  : out std_logic
     );
  end component;
  
  
    
  type array1 is array (7 downto 0) of std_logic_vector(7 downto 0);
  signal ab : array1; 
 signal s1, c1, s3, c3, s6, c6 : std_logic_vector(11 downto 0);
  signal s2, c2, s4, c4, s5, c5 : std_logic_vector(5 downto 0);
  signal x, y : std_logic_vector(15 downto 0);
  
--Temp Concate signals
  signal temp_x1,temp_y1,temp_z1,temp_x3,temp_z3,temp_y6,temp_z6         : std_logic_vector(11 downto 0);
  signal temp_z2,temp_y4,temp_z4,temp_y5                                 : std_logic_vector(5 downto 0);
  begin
  gen_mult : for i in 7 downto 0 generate 
    ab(i) <= a(7 downto 0) and (7 downto 0 => b(i));
  end generate gen_mult;   

-- Temporary signals 
--temp_x1  <= (ab(6)(7 to 7) & ab(5)(7 to 7) & ab(4)(7 to 7) & ab(5)(5 to 5) & ab(6)(3 to 3) & ab(7)(1 to 1) & ab(0)(7 downto 2));
temp_x1  <= (ab(6)(7 downto 7) & ab(5)(7 downto 7) & ab(4)(7 downto 7) & ab(5)(5 downto 5) & ab(6)(3 downto 3) & ab(7)(1 downto 1) & ab(0)(7 downto 2));
temp_y1  <= (ab(7)(6 downto 6) & ab(6)(6 downto 6) & ab(5)(6 downto 6) & ab(6)(4 downto 4)) & ab(7)(2 downto 2) & ab(1)(7 downto 1);
temp_z1  <= ('0' & ab(7)(5 downto 5) & ab(6)(5 downto 5) & ab(7)(3 downto 3) & ab(2)(7 downto 0));
temp_z2  <= ('0' & ab(5)(4 downto 0));
temp_x3  <= (ab(7)(7 downto 7) & s1(11 downto 1));
temp_z3  <= ("000" & ab(7)(4 downto 4) & s2(5 downto 0) & ab(3)(1 downto 0));
temp_y4  <= ("000" & ab(6)(2 downto 0));
temp_z4  <= ("0000" & ab(7)(0 downto 0) & '0');
temp_y5  <= ('0' & s4(5 downto 1));
temp_y6  <= (c3(10 downto 9) & s5(5 downto 0) & c3(2 downto 0) & '0');
temp_z6  <= ('0' & c5(5 downto 0) & '0' & s4(0) & '0' & ab(4)(0 downto 0) & '0');


  -- Reduction 1
  proj_csa_1 : proj_csa generic map (12)  port map  (x => temp_x1, y => temp_y1, z => temp_z1,s => s1,c => c1);
   
   proj_csa_2 : proj_csa generic map (6)  port map  (x => ab(3)(7 downto 2),
                                                     y => ab(4)(6 downto 1),
                                                     z => temp_z2,
                                                     s => (s2), 
                                                     c => (c2));
   -- Reduction 2
   proj_csa_3 : proj_csa generic map (12)  port map  ( x => temp_x3,
                                                       y => c1(11 downto 0),
                                                       z => temp_z3,
                                                       s => (s3), 
                                                       c => (c3));
        
   proj_csa_4 : proj_csa generic map (6)  port map   ( x => c2(5 downto 0),
                                                       y => temp_y4,
                                                       z => temp_z4,
                                                       s => s4, 
                                                       c => c4);
-- Reduction 3                                    
   proj_csa_5 : proj_csa generic map (6)  port map    ( x => c3(8 downto 3),
                                                        y => temp_y5,
                                                        z => c4(5 downto 0),
                                                        s => s5,
                                                        c => c5);
  
   proj_csa_6 : proj_csa generic map (12)  port map    ( x => s3(11 downto 0),
                                                        y => temp_y6,
                                                        z => temp_z6,
                                                        s => s6,
                                                        c => c6);
-- Reduction 4 Final
                                                        
                                                        x <= (c3(11) & s6(11 downto 0) & s1(0) & ab(0)(1 downto 1) & ab(0)(0 downto 0));
                                                        y <= (c6(11 downto 0) & "00" & ab(1)(0 downto 0) & '0'); 
proj_fa_1 : proj_fa generic map (16)  port map        ( x => x, y => y, cin => '0', s => z );


end proj_mult8_arch;

 
               
  

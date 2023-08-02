library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity proj_toplevel is
generic(width : integer := 8);
port ( 
  a     : in std_logic_vector(width - 1 downto 0);
  b     : in std_logic_vector(width - 1 downto 0);
  clk   : in std_logic;
  load  : in std_logic;
  clr   : in std_logic;
  endF  : out std_logic;
  z     : out std_logic_vector(width*2 - 1 downto 0)
  );
end proj_toplevel;

architecture proj_toplevel_arch of proj_toplevel is 

--Edge 
component proj_edge 
  generic(del   : time := 2 ns;
          pos   : integer := 1);
   port (
      sig      :in std_logic;
      edg      :out std_logic
   );
 end component;

--Dff_v
component proj_dff_v
  generic(width : integer := 1;
          delay : time := 1 ns); 
  port(
    d    : in  std_logic_vector(width-1 downto 0);
    en   : in  std_logic;
    clk  : in  std_logic;
    q    : out std_logic_vector(width-1 downto 0));
    
  end component;
  --Dff 
  component proj_dff
    generic(
            delay : time := 1 ns); 
    port(
      d    : in  std_logic;
      en   : in  std_logic;
      clk  : in  std_logic;
      q    : out std_logic
      );
    end component;
--Mult8
component proj_mult8 
  port (
   a,b : in std_logic_vector(7 downto 0);
   z   : out std_logic_vector(15 downto 0)
 );
 end component;
 
--Fa
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
  
--Mux
component proj_mux2to1
  generic(width : integer := 8);
  port(
    a   : in  std_logic_vector(width-1 downto 0);
    b   : in  std_logic_vector(width-1 downto 0);
    sel : in  std_logic;
    o   : out std_logic_vector(width-1 downto 0));
  end component;
  
  -- signal declaration
signal a_str, b_str, a_reg, b_reg, f1_b                                                 : std_logic_vector(width - 1 downto 0);
signal c_pos, c_neg, ld_pos,  in_ld, ld_neg                                              : std_logic;
--signal ld_neg : std_logic_vector(0 downto 0);
signal e_flag, c_flag, f1_e_flag, f1_c_flag, f2_e_flag, f2_c_flag, f3_e_flag, f3_c_flag : std_logic;
signal f0_l_en, f0_c_en, f1_en, f2_en, f3_en                                            : std_logic;
signal a_sq, f1_a_sq                                                                    : std_logic_vector(width*2 - 1 downto 0);
signal f1_ab_lsb, f1_ab_msb, f2_ab_lsb, f2_ab_msb                                       : std_logic_vector(width*2 - 1 downto 0 );
signal f2_ab_msb_c, f2_ab_lsb_c                                                         : std_logic_vector(width*2 + 8 - 1 downto 0);
signal f2_ab_mult                                                                       : std_logic_vector(width*3 - 1 downto 0);
signal f2_ab_drop, f3_ab_drop                                                           : std_logic_vector(width*3 - 3 downto 0);
signal f3_ab_incr, f3_z_out, f3_ab_drop_a                                               : std_logic_vector(width*3 - 3 downto 0);

begin 
  a_str <= (width - 1 downto 0 =>  (not clr)) and a;
  b_str <= (width - 1 downto 0 =>  (not clr)) and b;
  
f0_pedge_ld : proj_edge generic map (pos => 1) port map (sig => load,
                                                       edg => ld_pos);
f0_nedge_ld : proj_edge generic map(pos => 0 ) port map (
                                    sig => load,
                                    edg => ld_neg);
f0_pedge_c : proj_edge generic map(pos => 1)port map ( 
                                    sig => clr,
                                    edg => c_pos);
f0_nedge_c : proj_edge  generic map(pos => 0) port map (
                                    sig => clr,
                                    edg => c_neg);
  in_ld <= ld_neg or  clr;
  
f0_dff_ain : proj_dff_v generic map(width => width)  port map(d => a_str,
                                                                      clk => in_ld,
                                                                      en => '1',
                                                                      q => a_reg);

f0_dff_bin : proj_dff_v generic map(width => width)  port map(d => b_str,
                                                                      clk => in_ld,
                                                                      en => '1',
                                                                      q => b_reg);

f0_l_en <= (clk and ld_pos) or ld_neg;

f0_ld_ain : proj_dff  port map(d => ld_neg,
                                                                    clk => f0_l_en,
                                                                     en => '1',
                                                                      q => e_flag);

--f0_c_en <= (clk and c_neg) or c_pos;
f0_c_en <= c_pos;
f0_dff_clr : proj_dff  port map(d => clr,
                                                              clk => f0_c_en,
                                                              en  => '1',
                                                              q   => c_flag);

-- Equation for Z = 1/4 [A *A * B] +1

-- A*A

f0_mult8_sq : proj_mult8 port map(a => a_reg, b => a_reg, z => a_sq);
f1_en <= e_flag or c_flag;

-- Flop stage 1

f1_sq : proj_dff_v generic map(width => width*2) port map(d => a_sq, clk => clk, en => f1_en, q => f1_a_sq);
f1_bin : proj_dff_v generic map(width => width) port map(d => b_reg, clk => clk, en => f1_en, q => f1_b);
f1_e : proj_dff  port map(d => e_flag, clk => clk, en => '1', q => f1_e_flag);
f1_clr : proj_dff port map(d => c_flag, clk => clk, en => '1', q => f1_c_flag);

-- *B - partial mult
f1_mult8_bl : proj_mult8  port map(a => f1_a_sq(7 downto 0), b => f1_b, z => f1_ab_lsb); 
f1_mult8_bm : proj_mult8  port map(a => f1_a_sq(15 downto 8), b => f1_b, z => f1_ab_msb);
  
  --flop stage 2
f2_en <= (f1_e_flag or f1_c_flag);

f2_lsb : proj_dff_v generic map(width => width*2) port map(d => f1_ab_lsb, clk => clk, en => f2_en, q => f2_ab_lsb);
  
f2_msb : proj_dff_v generic map(width => width*2) port map(d => f1_ab_msb, clk => clk, en => f2_en, q => f2_ab_msb);

f2_e : proj_dff port map(d => f1_e_flag, clk => clk, en => '1', q => f2_e_flag);

f2_clr : proj_dff port map(d => f1_c_flag, clk => clk, en => '1', q => f2_c_flag);

-- * B - result
f2_ab_msb_c <= f2_ab_msb & "00000000";
f2_ab_lsb_c <= "00000000" & f2_ab_lsb;
f2_fa_mult : proj_fa  generic map(width => width*3) port map(x => f2_ab_msb_c, y => f2_ab_lsb_c, cin => '0', s => f2_ab_mult);

--1/4 [A * A * B]

 f2_ab_drop <= f2_ab_mult(width*3 - 1 downto 2);
 
 --Flop stage 2
 
 f3_en <= (f2_e_flag or f2_c_flag);
 
 f3_drp : proj_dff_v generic map(width => width*3 - 2) port map (d => f2_ab_drop, clk => clk, en =>  f3_en, q => f3_ab_drop);
   
 f3_e : proj_dff port map(d => f2_e_flag,  clk => clk, en => '1',  q => f3_e_flag);
   
 f3_clr : proj_dff   port map(d => f2_c_flag,  clk => clk, en => '1',  q => f3_c_flag);
 
 -- 1/4 [A * A * B] + 1
 --f3_ab_drop_a <= (width*3 - 3 => '0') & '1';
 f3_ab_drop_a <= (0 => '1', others => '0');
 f3_incr : proj_fa generic map(width => width*3 - 2) port map ( x => f3_ab_drop, y => f3_ab_drop_a, cin => '0', s => f3_ab_incr);
 
 --Output
 
 f3_mux : proj_mux2to1 generic map(width => width*3 - 2) port map(a => (others => '0'), b => f3_ab_incr, sel => f3_c_flag, o => f3_z_out);
   
z <= f3_z_out(width*2-1 downto 0);
endF <= f3_e_flag;
 
 end proj_toplevel_arch;
  
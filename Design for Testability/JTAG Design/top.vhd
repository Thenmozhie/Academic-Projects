
---------------------------JTAG without multiplier. to run this top, the bsr ports has to be mapped----------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity top is
  Port (
  tdi, tms, tck, trst : in std_logic;
  device_input : in std_logic_vector(15 downto 0);
  device_output : out std_logic_vector( 15 downto 0);
  tdo : out std_logic 
   );
end top;

architecture structural of top is



component tap_controller is
port(
		tms, rst, clk: in std_logic;
        sel, dr_clk, ir_clk, dr_capture, dr_shift, dr_update: out std_logic;
        ir_shift, ir_update,ir_capture : out std_logic);
end component;


component bp_register is
port(
tdi,shift_dr,clkdr: in std_logic;
    Q: out std_logic);
end component;

component mux is
port(
a, b, s : in std_logic;
     f : out std_logic);
end component;

-- component dff_rise is
-- port(
-- d :in  std_logic;    
      -- clk :in std_logic;   
      -- q : out std_logic
-- );
-- end component;


-- component dff_fall is
-- port(
-- d :in  std_logic;    
      -- clk :in std_logic;   
      -- q : out std_logic  
-- );
-- end component;

-- component bsc is
-- port(
-- pi,si : in std_logic;
  -- shift_dr,mode : in std_logic;
  -- clk_dr,update_dr : in std_logic;
  -- so,po : out std_logic
-- );
-- end component;

component bsr is
port(
tdi: in std_logic; 
        tdo: out std_logic; 
        din_i: in std_logic_vector(15 downto 0); --data in for input side
		
        dout_i: out std_logic_vector(7 downto 0); --data out for input side
		dout_ii:out std_logic_vector(7 downto 0); -- Data Out for input side 
		
		din_o: in std_logic_vector(15 downto 0); --data in for output side
        dout_o: out std_logic_vector(15 downto 0); --data out for output side
        clk_dr: in std_logic; 
        update_dr: in std_logic; 
        shift_dr: in std_logic; 
        mode: in std_logic 
);
end component;


component ir is
port(
tdi : in std_logic;
  shift_ir,dum: in std_logic;
  clk_ir,update_ir : in std_logic;
  lsb, cs1,cs2 : out std_logic
);
end component;


component ir_decode is
port(
cs1, cs2: in std_logic;
    mode, sel: out std_logic
);
end component;

-- component multi_8bit is
-- port(
-- a : in STD_LOGIC_VECTOR (7 downto 0);
  -- x : in STD_LOGIC_VECTOR (7 downto 0);
  -- p : out STD_LOGIC_VECTOR (15 downto 0)
-- );
-- end component;

----------------top module mux signals----------------
		signal bsr_out_to_data_mux,
				bp_out_to_data_mux,
				id_to_data_mux,
				data_mux_to_inst_mux,
				ir_out_to_inst_mux,
				tap_to_inst_mux: std_logic;


-------------tap signal-------		
        signal dr_clk, ir_clk, dr_capture, dr_shift, dr_update: std_logic;
        signal ir_shift, ir_update,ir_capture : std_logic;
		
---------------bypass register signal-----	
		--signal bypass_register_out:  std_logic;
		
-------------- bsr signal-------------------
		  
        ---din_i: in std_logic_vector(15 downto 0); --data in for input side
        signal a: std_logic_vector(7 downto 0); --data out for input side
		signal x: std_logic_vector(7 downto 0); --data out for input side
		
		signal din_o: std_logic_vector(15 downto 0); --data in for output side
        ----dout_o: out std_logic_vector(15 downto 0); --data out for output side
        signal mode: std_logic ;
		
--------------- ir signal--------------------
		
        signal dum: std_logic;
        signal cs1,cs2 : std_logic;
	
-------------- ir decoder signal-------------------
		
		-- signal mode: std_logic;
		
-------------- multiplie signals ---------------------

		--signal a: STD_LOGIC_VECTOR (7 downto 0);
		--signal x: STD_LOGIC_VECTOR (7 downto 0);
		--signal p: STD_LOGIC_VECTOR (15 downto 0);		


begin


tapcontrollermap: tap_controller port map( tms, trst, tck, tap_to_inst_mux, dr_clk, ir_clk, dr_capture, dr_shift, dr_update, ir_shift, ir_update, ir_capture );


bpregistermap: bp_register port map( tdi, dr_shift, dr_clk, bp_out_to_data_mux);


datamuxmap: mux port map( bsr_out_to_data_mux, bp_out_to_data_mux, id_to_data_mux, data_mux_to_inst_mux);


instmuxmap: mux port map( data_mux_to_inst_mux, ir_out_to_inst_mux, tap_to_inst_mux, tdo);

----------- enable bsrmap by mapping the blank inputs, for instance a, x and p in multiplier case-----------------------
--------bsrmap: bsr port map( tdi, bsr_out_to_data_mux, device_input (15 downto 0),____________,____________, ______________, device_output( 15 downto 0), dr_clk, dr_update, dr_shift, mode);


irmap: ir port map( tdi, ir_shift, dum, ir_clk, ir_update, ir_out_to_inst_mux, cs1, cs2 );


irdecodemap: ir_decode port map( cs1, cs2, mode, id_to_data_mux );


--multipliermap: multi_8bit port map( a(7 downto 0), x(7 downto 0), p (15 downto 0) );

end structural;
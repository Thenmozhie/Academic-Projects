----------------------------------bsr----------------------
library ieee;
use ieee. std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity bsr is
    port(
        tdi: in std_logic; 
        tdo: out std_logic;
        din_i: in std_logic_vector(15 downto 0); -- Data in for input side
		
		
        dout_i: out std_logic_vector(7 downto 0); -- Data Out for input side
		dout_ii:out std_logic_vector(7 downto 0); -- Data Out for input side 
		
		
		din_o: in std_logic_vector(15 downto 0); -- Data In for output side
        dout_o: out std_logic_vector(15 downto 0); -- Data Out for output side
        clk_dr: in std_logic; 
        update_dr: in std_logic; 
        shift_dr: in std_logic;
        mode: in std_logic 
    );
end bsr;

architecture structural of bsr is
    component bsc is
        port(pi,si : in std_logic;
			shift_dr,mode : in std_logic;
			clk_dr,update_dr : in std_logic;
			so,po : out std_logic);
    end component;
	
	signal cell0_to_cell1: std_logic;
    signal cell1_to_cell2: std_logic;
    signal cell2_to_cell3: std_logic;
    signal cell3_to_cell4: std_logic;
    signal cell4_to_cell5: std_logic;
    signal cell5_to_cell6: std_logic;
	signal cell6_to_cell7: std_logic;
    signal cell7_to_cell8: std_logic;
    signal cell8_to_cell9: std_logic;
    signal cell9_to_cell10: std_logic;
    signal cell10_to_cell11: std_logic;
	signal cell11_to_cell12: std_logic;
    signal cell12_to_cell13: std_logic;
    signal cell13_to_cell14: std_logic;
    signal cell14_to_cell15: std_logic;
    signal cell15_to_cell16: std_logic;
	signal cell16_to_cell17: std_logic;
    signal cell17_to_cell18: std_logic;
    signal cell18_to_cell19: std_logic;
    signal cell19_to_cell20: std_logic;
    signal cell20_to_cell21: std_logic;
	signal cell21_to_cell22: std_logic;
	signal cell22_to_cell23: std_logic;
    signal cell23_to_cell24: std_logic;
    signal cell24_to_cell25: std_logic;
    signal cell25_to_cell26: std_logic;
    signal cell26_to_cell27: std_logic;
	signal cell27_to_cell28: std_logic;
    signal cell28_to_cell29: std_logic;
    signal cell29_to_cell30: std_logic;
    signal cell30_to_cell31: std_logic;
    signal cell31_to_cell32: std_logic;


begin
-------------------------------------------------------input -----------------------------
    cell0: bsc port map	(din_i(0),tdi,
						shift_dr,mode,
						clk_dr,update_dr,
						cell0_to_cell1,dout_i(0));

    cell1: bsc port map	(din_i(1),cell0_to_cell1,
						shift_dr,mode,
						clk_dr,update_dr,
						cell1_to_cell2,dout_i(1));
						
	cell2: bsc port map	(din_i(2),cell1_to_cell2,
						shift_dr,mode,
						clk_dr,update_dr,
						cell2_to_cell3,dout_i(2));
	cell3: bsc port map	(din_i(3),cell2_to_cell3,
						shift_dr,mode,
						clk_dr,update_dr,
						cell3_to_cell4,dout_i(3));
	cell4: bsc port map	(din_i(4),cell3_to_cell4,
						shift_dr,mode,
						clk_dr,update_dr,
						cell4_to_cell5,dout_i(4));
	cell5: bsc port map	(din_i(5),cell4_to_cell5,
						shift_dr,mode,
						clk_dr,update_dr,
						cell5_to_cell6,dout_i(5));
	cell6: bsc port map	(din_i(6),cell5_to_cell6,
						shift_dr,mode,
						clk_dr,update_dr,
						cell6_to_cell7,dout_i(6));					
	cell7: bsc port map	(din_i(7),cell6_to_cell7,
						shift_dr,mode,
						clk_dr,update_dr,
						cell7_to_cell8,dout_i(7));					
	cell8: bsc port map	(din_i(8),cell7_to_cell8,
						shift_dr,mode,
						clk_dr,update_dr,
						cell8_to_cell9,dout_ii(0));					
	cell9: bsc port map	(din_i(9),cell8_to_cell9,
						shift_dr,mode,
						clk_dr,update_dr,
						cell9_to_cell10,dout_ii(1));					
	cell10: bsc port map(din_i(10),cell9_to_cell10,
						shift_dr,mode,
						clk_dr,update_dr,
						cell10_to_cell11,dout_ii(2));					
						
	cell11: bsc port map(din_i(11),cell10_to_cell11,
						shift_dr,mode,
						clk_dr,update_dr,
						cell11_to_cell12,dout_ii(3));					
	cell12: bsc port map	(din_i(12),cell11_to_cell12,
						shift_dr,mode,
						clk_dr,update_dr,
						cell12_to_cell13,dout_ii(4));					
						
	cell13: bsc port map	(din_i(13),cell12_to_cell13,
						shift_dr,mode,
						clk_dr,update_dr,
						cell13_to_cell14,dout_ii(5));					
						
	cell14: bsc port map	(din_i(14),cell13_to_cell14,
						shift_dr,mode,
						clk_dr,update_dr,
						cell14_to_cell15,dout_ii(6));	

						
					
	cell15: bsc port map	(din_i(15),cell14_to_cell15,
						shift_dr,mode,
						clk_dr,update_dr,
						cell15_to_cell16,dout_ii(7));			

-----------------------------------------------------------------------------------output -----------------------							
						
	cell16: bsc port map	(din_o(15),cell15_to_cell16,
						shift_dr,mode,
						clk_dr,update_dr,
						cell16_to_cell17,dout_o(15));					
						
	cell17: bsc port map	(din_o(14),cell16_to_cell17,
						shift_dr,mode,
						clk_dr,update_dr,
						cell17_to_cell18,dout_o(14));					
						
	cell18: bsc port map	(din_o(13),cell17_to_cell18,
						shift_dr,mode,
						clk_dr,update_dr,
						cell18_to_cell19,dout_o(13));					
						
	cell19: bsc port map	(din_o(12),cell18_to_cell19,
						shift_dr,mode,
						clk_dr,update_dr,
						cell19_to_cell20,dout_o(12));					
						
	cell20: bsc port map	(din_o(11),cell19_to_cell20,
						shift_dr,mode,
						clk_dr,update_dr,
						cell20_to_cell21,dout_o(11));					
						
	cell21: bsc port map	(din_o(10),cell20_to_cell21,
						shift_dr,mode,
						clk_dr,update_dr,
						cell21_to_cell22,dout_o(10));					
	cell22: bsc port map	(din_o(9),cell21_to_cell22,
						shift_dr,mode,
						clk_dr,update_dr,
						cell22_to_cell23,dout_o(9));					
	cell23: bsc port map	(din_o(8),cell22_to_cell23,
						shift_dr,mode,
						clk_dr,update_dr,
						cell23_to_cell24,dout_o(8));
	cell24: bsc port map	(din_o(7),cell23_to_cell24,
						shift_dr,mode,
						clk_dr,update_dr,
						cell24_to_cell25,dout_o(7));

	cell25: bsc port map	(din_o(6),cell24_to_cell25,
						shift_dr,mode,
						clk_dr,update_dr,
						cell25_to_cell26,dout_o(6));
						
	cell26: bsc port map	(din_o(5),cell25_to_cell26,
						shift_dr,mode,
						clk_dr,update_dr,
						cell26_to_cell27,dout_o(5));					
						
	cell27: bsc port map	(din_o(4),cell26_to_cell27,
						shift_dr,mode,
						clk_dr,update_dr,
						cell27_to_cell28,dout_o(4));					
	cell28: bsc port map	(din_o(3),cell27_to_cell28,
						shift_dr,mode,
						clk_dr,update_dr,
						cell28_to_cell29,dout_o(3));					
	cell29: bsc port map	(din_o(2),cell28_to_cell29,
						shift_dr,mode,
						clk_dr,update_dr,
						cell29_to_cell30,dout_o(2));
	cell30: bsc port map	(din_o(1),cell29_to_cell30,
						shift_dr,mode,
						clk_dr,update_dr,
						cell30_to_cell31,dout_o(1));

	cell31: bsc port map	(din_o(0),cell30_to_cell31,
						shift_dr,mode,
						clk_dr,update_dr,
						tdo,dout_o(0));										
end structural;







library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity rca is
	port( A, B  : in std_logic_vector (15 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (15 downto 0);
		  carry_out : out std_logic);
end rca;

-- Architecture Implementation:
architecture dataflow of rca is

-- Component Declaration of full_adder:
component full_adder1 
	port( A, B, carry_in : in std_logic;
		  sum, carry_out : out std_logic);
end component; 

-- Signal declaration of internal variables:
signal C: std_logic_vector (16 downto 0);

begin

-- Assign the value of Carry in to C(0):
C(0) <= carry_in;

FA1: full_adder1 port map (A(0), B(0), C(0), sum(0), C(1));
FA2: full_adder1 port map (A(1), B(1), C(1), sum(1), C(2));
FA3: full_adder1 port map (A(2), B(2), C(2), sum(2), C(3));
FA4: full_adder1 port map (A(3), B(3), C(3), sum(3), C(4));
FA5: full_adder1 port map (A(4), B(4), C(4), sum(4), C(5));
FA6: full_adder1 port map (A(5), B(5), C(5), sum(5), C(6));
FA7: full_adder1 port map (A(6), B(6), C(6), sum(6), C(7));
FA8: full_adder1 port map (A(7), B(7), C(7), sum(7), C(8));
FA9: full_adder1 port map (A(8), B(8), C(8), sum(8), C(9));
FA10: full_adder1 port map (A(9), B(9), C(9), sum(9), C(10));
FA11: full_adder1 port map (A(10), B(10), C(10), sum(10), C(11));
FA12: full_adder1 port map (A(11), B(11), C(11), sum(11), C(12));
FA13: full_adder1 port map (A(12), B(12), C(12), sum(12), C(13));
FA14: full_adder1 port map (A(13), B(13), C(13), sum(13), C(14));
FA15: full_adder1 port map (A(14), B(14), C(14), sum(14), C(15));
FA16: full_adder1 port map (A(15), B(15), C(15), sum(15), C(16));

-- Assign the value of C(4) to Carry out:
carry_out <= C(16);

end dataflow;


library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity rca22 is
	port( A, B  : in std_logic_vector (23 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (23 downto 0);
		  carry_out : out std_logic);
end rca22;

-- Architecture Implementation:
architecture dataflow of rca22 is

-- Component Declaration of full_adder:
component full_adder1 
	port( A, B, carry_in : in std_logic;
		  sum, carry_out : out std_logic);
end component; 

-- Signal declaration of internal variables:
signal C: std_logic_vector (24 downto 0);

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

FA17: full_adder1 port map (A(16), B(16), C(16), sum(16), C(17));
FA18: full_adder1 port map (A(17), B(17), C(17), sum(17), C(18));
FA19: full_adder1 port map (A(18), B(18), C(18), sum(18), C(19));
FA20: full_adder1 port map (A(19), B(19), C(19), sum(19), C(20));
FA21: full_adder1 port map (A(20), B(20), C(20), sum(20), C(21));
FA22: full_adder1 port map (A(21), B(21), C(21), sum(21), C(22));
FA23: full_adder1 port map (A(22), B(22), C(22), sum(22), C(23));
FA24: full_adder1 port map (A(23), B(23), C(23), sum(23), C(24));
-- Assign the value of C(24) to Carry out:
carry_out <= C(24);

end dataflow;


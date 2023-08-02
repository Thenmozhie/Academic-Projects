library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity multiplier3 is
	port( A,B : in std_logic_vector (7 downto 0);
		 Z: out std_logic_vector (23 downto 0));
end multiplier3;

-- Architecture Implementation:
architecture mul3 of multiplier3 is

-- Component Declaration of partial product:
Component partial_product 
	port( A,B  : in std_logic_vector (7 downto 0);
		  P: out std_logic_vector (64 downto 1));
end Component;

-- component declaration for 16 by 8 bit multiplication
Component multiplier 
	port( A : in std_logic_vector (15 downto 0);
		B: in std_logic_vector(7 downto 0);
		 Z: out std_logic_vector (23 downto 0));
end Component;

-- Component Declaration of half adder:
Component half_adder1
	port( A, B : in std_logic;
		  sum, carry : out std_logic);
end Component;

-- Component Declaration of full_adder:
Component full_adder1
	port( A, B, carry_in : in std_logic;
		  sum, carry_out : out std_logic);
end Component; 

-- Signal declarations:
signal P: std_logic_vector (64 downto 1);
signal S: std_logic_vector (21 downto 0);
signal M: std_logic_vector (37 downto 0);
signal C: std_logic_vector (60 downto 0);
signal T: std_logic_vector (16 downto 0);

begin

-- Finding the partial products of the 8 bit number: 
result: partial_product port map (A (7 downto 0),B (7 downto 0), P (64 downto 1));

-- Performing addition on partial products using half adders and full adders:

-- First Phase:
M(0)<=P(1);
HA1: half_adder1 port map (P(2), P(9), M(1), C(0));
FA1: full_adder1 port map (P(3), P(10),C(0), S(0), C(1));
HA2: half_adder1 port map (P(17), S(0), M(2), C(2));
FA2: full_adder1 port map (P(4), P(11),C(1), S(1), C(3));
FA3: full_adder1 port map (P(18), S(1),C(2), M(3), C(4));
FA4: full_adder1 port map (P(5), P(12),C(3), S(2), C(5));
FA5: full_adder1 port map (P(19), S(2),C(4), M(4), C(6));
FA6: full_adder1 port map (P(6), P(13),C(5), S(3), C(7));
FA7: full_adder1 port map (P(20), S(3),C(6), M(5), C(8));
FA8: full_adder1 port map (P(7), P(14),C(7), S(4), C(9));
FA9: full_adder1 port map (P(21), S(4),C(8), M(6), C(10));
FA10: full_adder1 port map (P(8), P(15),C(9), S(5), C(11));
FA11: full_adder1 port map (P(22), S(5),C(10), M(7), C(12));
FA12: full_adder1 port map (P(16), P(23),C(11), S(6), C(13));
HA3: half_adder1 port map (C(12), S(6), M(8), C(14));
FA13: full_adder1 port map (P(27), C(13),C(14), M(9), C(15));
M(10)<=C(15);

--Second Phase:
M(11)<=P(25);
HA4: half_adder1 port map (P(26), P(33), M(12), C(16));
FA14: full_adder1 port map (P(27), P(34),C(16), S(7), C(17));
HA5: half_adder1 port map (P(41), S(7), M(13), C(18));
FA15: full_adder1 port map (P(28), P(35),C(17), S(8), C(19));
FA16: full_adder1 port map (P(42), S(8),C(18), M(14), C(20));
FA17: full_adder1 port map (P(29), P(36),C(19), S(9), C(21));
FA18: full_adder1 port map (P(43), S(9),C(20), M(15), C(22));
FA19: full_adder1 port map (P(30), P(37),C(21), S(10), C(23));
FA20: full_adder1 port map (P(44), S(10),C(22), M(16), C(24));
FA21: full_adder1 port map (P(31), P(38),C(23), S(11), C(25));
FA22: full_adder1 port map (P(45), S(11),C(24), M(17), C(26));
FA23: full_adder1 port map (P(32), P(39),C(25), S(12), C(27));
FA24: full_adder1 port map (P(46), S(12),C(26), M(18), C(28));
FA25: full_adder1 port map (P(40), P(47),C(27), S(13), C(29));
HA6: half_adder1 port map (C(28), S(13), M(19), C(30));
FA26: full_adder1 port map (P(48), C(29),C(30), M(20), C(31));
M(21)<=C(31);


--third phase:

M(22)<=M(0);
M(23)<=M(1);
M(24)<=M(2);
HA7: half_adder1 port map (M(3), M(11), M(25), C(32));
FA27: full_adder1 port map (M(4), M(12),C(32), M(26), C(33));
FA28: full_adder1 port map (M(5), M(13),C(33), M(27), C(34));
FA29: full_adder1 port map (M(6), M(14),C(34), S(14), C(35));
HA8 : half_adder1 port map (P(49),S(14), M(28), C(36));
FA30: full_adder1 port map (M(7), M(15),C(35), S(15), C(37));
FA31: full_adder1 port map (P(50), S(15),C(36), M(29), C(38));
FA32: full_adder1 port map (M(8), M(16),C(37), S(16), C(39));
FA33: full_adder1 port map (P(51), S(16),C(38), M(30), C(40));
FA34: full_adder1 port map (M(9), M(17),C(39), S(17), C(41));
FA35: full_adder1 port map (P(52), S(17),C(40), M(31), C(42));
FA36: full_adder1 port map (M(10), M(18),C(41), S(18), C(43));
FA37: full_adder1 port map (P(53), S(18),C(32), M(32), C(44));
FA38: full_adder1 port map (M(19), C(43),P(54), S(19), C(45));
HA9 : half_adder1 port map (C(44),S(19), M(33), C(46));
FA39: full_adder1 port map (M(20), C(45),P(55), S(20), C(47));
HA10 : half_adder1 port map (C(46),S(20), M(34), C(48));
FA40: full_adder1 port map (M(21), C(47),P(56), S(21), C(49));
HA11 : half_adder1 port map (C(48),S(21), M(35), C(50));
HA12 : half_adder1 port map (C(49),C(50), M(36), C(51));
M(37)<=C(51);

--Fourth Phase:
T(0)<=M(22);
T(1)<=M(23);
T(2)<=M(24);
T(3)<=M(25);
T(4)<=M(26);
T(5)<=M(27);
T(6)<=M(28);
HA13 : half_adder1 port map (M(29),P(57), T(7), C(52));
FA41: full_adder1 port map (M(30), P(58),C(52), T(8), C(53));
FA42: full_adder1 port map (M(31), P(59),C(53), T(9), C(54));
FA43: full_adder1 port map (M(32), P(60),C(54), T(10), C(55));
FA44: full_adder1 port map (M(33), P(61),C(55), T(11), C(56));
FA45: full_adder1 port map (M(34), P(62),C(56), T(12), C(57));
FA46: full_adder1 port map (M(35), P(63),C(57), T(13), C(58));
FA47: full_adder1 port map (M(36), P(64),C(58), T(14), C(59));
HA14 : half_adder1 port map (M(37),C(59), T(15), C(60));

Mul16by8: multiplier port map( T(15 downto 0), A ( 7 downto 0), Z( 23 downto 0));



end mul3;



library IEEE;
use ieee.std_logic_1164.all; 
entity partial_product is
	port( A,B : in std_logic_vector (7 downto 0);
	      P	  : out std_logic_vector (64 downto 1));
end partial_product;

architecture result of partial_product is

Component and1
	port( A,B : in std_logic; Z : out std_logic);
end Component;

begin
P1 : and1 port map (B(0), A(0), P(1));
P2 : and1 port map (B(0), A(1), P(2));
P3 : and1 port map (B(0), A(2), P(3));
P4 : and1 port map (B(0), A(3), P(4));
P5 : and1 port map (B(0), A(4), P(5));
P6 : and1 port map (B(0), A(5), P(6));
P7 : and1 port map (B(0), A(6), P(7));
P8 : and1 port map (B(0), A(7), P(8));
P9 : and1 port map (B(1), A(0), P(9));
P10: and1 port map (B(1), A(1), P(10));
P11: and1 port map (B(1), A(2), P(11));
P12: and1 port map (B(1), A(3), P(12));
P13: and1 port map (B(1), A(4), P(13));
P14: and1 port map (B(1), A(5), P(14));
P15: and1 port map (B(1), A(6), P(15));
P16: and1 port map (B(1), A(7), P(16));
P17: and1 port map (B(2), A(0), P(17));
P18: and1 port map (B(2), A(1), P(18));
P19: and1 port map (B(2), A(2), P(19));
P20: and1 port map (B(2), A(3), P(20));
P21: and1 port map (B(2), A(4), P(21));
P22: and1 port map (B(2), A(5), P(22));
P23: and1 port map (B(2), A(6), P(23));
P24: and1 port map (B(2), A(7), P(24));
P25: and1 port map (B(3), A(0), P(25));
P26: and1 port map (B(3), A(1), P(26));
P27: and1 port map (B(3), A(2), P(27));
P28: and1 port map (B(3), A(3), P(28));
P29: and1 port map (B(3), A(4), P(29));
P30: and1 port map (B(3), A(5), P(30));
P31: and1 port map (B(3), A(6), P(31));
P32: and1 port map (B(3), A(7), P(32));
P33: and1 port map (B(4), A(0), P(33));
P34: and1 port map (B(4), A(1), P(34));
P35: and1 port map (B(4), A(2), P(35));
P36: and1 port map (B(4), A(3), P(36));
P37: and1 port map (B(4), A(4), P(37));
P38: and1 port map (B(4), A(5), P(38));
P39: and1 port map (B(4), A(6), P(39));
P40: and1 port map (B(4), A(7), P(40));
P41: and1 port map (B(5), A(0), P(41));
P42: and1 port map (B(5), A(1), P(42));
P43: and1 port map (B(5), A(2), P(43));
P44: and1 port map (B(5), A(3), P(44));
P45: and1 port map (B(5), A(4), P(45));
P46: and1 port map (B(5), A(5), P(46));
P47: and1 port map (B(5), A(6), P(47));
P48: and1 port map (B(5), A(7), P(48));
P49: and1 port map (B(6), A(0), P(49));
P50: and1 port map (B(6), A(1), P(50));
P51: and1 port map (B(6), A(2), P(51));
P52: and1 port map (B(6), A(3), P(52));
P53: and1 port map (B(6), A(4), P(53));
P54: and1 port map (B(6), A(5), P(54));
P55: and1 port map (B(6), A(6), P(55));
P56: and1 port map (B(6), A(7), P(56));
P57: and1 port map (B(7), A(0), P(57));
P58: and1 port map (B(7), A(1), P(58));
P59: and1 port map (B(7), A(2), P(59));
P60: and1 port map (B(7), A(3), P(60));
P61: and1 port map (B(7), A(4), P(61));
P62: and1 port map (B(7), A(5), P(62));
P63: and1 port map (B(7), A(6), P(63));
P64: and1 port map (B(7), A(7), P(64));
end result;


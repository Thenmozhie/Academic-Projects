
library IEEE;
use ieee.std_logic_1164.all; 
entity partial_product24 is
	port( A: in std_logic_vector (15 downto 0);
		B: in std_logic_vector(7 downto 0);
	      P	  : out std_logic_vector (128 downto 1));
end partial_product24;

architecture result24 of partial_product24 is

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
P9 : and1 port map (B(0), A(8), P(9));
P10: and1 port map (B(0), A(9), P(10));
P11: and1 port map (B(0), A(10), P(11));
P12: and1 port map (B(0), A(11), P(12));
P13: and1 port map (B(0), A(12), P(13));
P14: and1 port map (B(0), A(13), P(14));
P15: and1 port map (B(0), A(14), P(15));
P16: and1 port map (B(0), A(15), P(16));

P17: and1 port map (B(1), A(0), P(17));
P18: and1 port map (B(1), A(1), P(18));
P19: and1 port map (B(1), A(2), P(19));
P20: and1 port map (B(1), A(3), P(20));
P21: and1 port map (B(1), A(4), P(21));
P22: and1 port map (B(1), A(5), P(22));
P23: and1 port map (B(1), A(6), P(23));
P24: and1 port map (B(1), A(7), P(24));
P25: and1 port map (B(1), A(8), P(25));
P26: and1 port map (B(1), A(9), P(26));
P27: and1 port map (B(1), A(10), P(27));
P28: and1 port map (B(1), A(11), P(28));
P29: and1 port map (B(1), A(12), P(29));
P30: and1 port map (B(1), A(13), P(30));
P31: and1 port map (B(1), A(14), P(31));
P32: and1 port map (B(1), A(15), P(32));


P33: and1 port map (B(2), A(0), P(33));
P34: and1 port map (B(2), A(1), P(34));
P35: and1 port map (B(2), A(2), P(35));
P36: and1 port map (B(2), A(3), P(36));
P37: and1 port map (B(2), A(4), P(37));
P38: and1 port map (B(2), A(5), P(38));
P39: and1 port map (B(2), A(6), P(39));
P40: and1 port map (B(2), A(7), P(40));
P41: and1 port map (B(2), A(8), P(41));
P42: and1 port map (B(2), A(9), P(42));
P43: and1 port map (B(2), A(10), P(43));
P44: and1 port map (B(2), A(11), P(44));
P45: and1 port map (B(2), A(12), P(45));
P46: and1 port map (B(2), A(13), P(46));
P47: and1 port map (B(2), A(14), P(47));
P48: and1 port map (B(2), A(15), P(48));

P49: and1 port map (B(3), A(0), P(49));
P50: and1 port map (B(3), A(1), P(50));
P51: and1 port map (B(3), A(2), P(51));
P52: and1 port map (B(3), A(3), P(52));
P53: and1 port map (B(3), A(4), P(53));
P54: and1 port map (B(3), A(5), P(54));
P55: and1 port map (B(3), A(6), P(55));
P56: and1 port map (B(3), A(7), P(56));
P57: and1 port map (B(3), A(8), P(57));
P58: and1 port map (B(3), A(9), P(58));
P59: and1 port map (B(3), A(10), P(59));
P60: and1 port map (B(3), A(11), P(60));
P61: and1 port map (B(3), A(12), P(61));
P62: and1 port map (B(3), A(13), P(62));
P63: and1 port map (B(3), A(14), P(63));
P64: and1 port map (B(3), A(15), P(64));

--
P65 : and1 port map (B(4), A(0), P(65));
P66 : and1 port map (B(4), A(1), P(66));
P67 : and1 port map (B(4), A(2), P(67));
P68 : and1 port map (B(4), A(3), P(68));
P69 : and1 port map (B(4), A(4), P(69));
P70 : and1 port map (B(4), A(5), P(70));
P71 : and1 port map (B(4), A(6), P(71));
P72 : and1 port map (B(4), A(7), P(72));
P73 : and1 port map (B(4), A(8), P(73));
P74: and1 port map (B(4), A(9), P(74));
P75: and1 port map (B(4), A(10), P(75));
P76: and1 port map (B(4), A(11), P(76));
P77: and1 port map (B(4), A(12), P(77));
P78: and1 port map (B(4), A(13), P(78));
P79: and1 port map (B(4), A(14), P(79));
P80: and1 port map (B(4), A(15), P(80));

P81: and1 port map (B(5), A(0), P(81));
P82: and1 port map (B(5), A(1), P(82));
P83: and1 port map (B(5), A(2), P(83));
P84: and1 port map (B(5), A(3), P(84));
P85: and1 port map (B(5), A(4), P(85));
P86: and1 port map (B(5), A(5), P(86));
P87: and1 port map (B(5), A(6), P(87));
P88: and1 port map (B(5), A(7), P(88));
P89: and1 port map (B(5), A(8), P(89));
P90: and1 port map (B(5), A(9), P(90));
P91: and1 port map (B(5), A(10), P(91));
P92: and1 port map (B(5), A(11), P(92));
P93: and1 port map (B(5), A(12), P(93));
P94: and1 port map (B(5), A(13), P(94));
P95: and1 port map (B(5), A(14), P(95));
P96: and1 port map (B(5), A(15), P(96));


P97: and1 port map (B(6), A(0), P(97));
P98: and1 port map (B(6), A(1), P(98));
P99: and1 port map (B(6), A(2), P(99));
P100: and1 port map (B(6), A(3), P(100));
P101: and1 port map (B(6), A(4), P(101));
P102: and1 port map (B(6), A(5), P(102));
P103: and1 port map (B(6), A(6), P(103));
P104: and1 port map (B(6), A(7), P(104));
P105: and1 port map (B(6), A(8), P(105));
P106: and1 port map (B(6), A(9), P(106));
P107: and1 port map (B(6), A(10), P(107));
P108: and1 port map (B(6), A(11), P(108));
P109: and1 port map (B(6), A(12), P(109));
P110: and1 port map (B(6), A(13), P(110));
P111: and1 port map (B(6), A(14), P(111));
P112: and1 port map (B(6), A(15), P(112));

P113: and1 port map (B(7), A(0), P(113));
P114: and1 port map (B(7), A(1), P(114));
P115: and1 port map (B(7), A(2), P(115));
P116: and1 port map (B(7), A(3), P(116));
P117: and1 port map (B(7), A(4), P(117));
P118: and1 port map (B(7), A(5), P(118));
P119: and1 port map (B(7), A(6), P(119));
P120: and1 port map (B(7), A(7), P(120));
P121: and1 port map (B(7), A(8), P(121));
P122: and1 port map (B(7), A(9), P(122));
P123: and1 port map (B(7), A(10), P(123));
P124: and1 port map (B(7), A(11), P(124));
P125: and1 port map (B(7), A(12), P(125));
P126: and1 port map (B(7), A(13), P(126));
P127: and1 port map (B(7), A(14), P(127));
P128: and1 port map (B(7), A(15), P(128));



end result24;


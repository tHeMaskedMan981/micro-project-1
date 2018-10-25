library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity padder is
	port (ir : in STD_LOGIC_VECTOR(8 DOWNTO 0);
			pad_out : out STD_LOGIC_VECTOR(15 DOWNTO 0));
end entity;

architecture struct1 of padder is
	pad_out(15 downto 7) <= unsigned(ir); pad_out(6 downto 0) <= (others => '0');
end struct1;
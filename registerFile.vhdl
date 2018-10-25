library ieee;
use ieee.std_logic_1164.all;
use numeric_std.all;

entity registerFile is

	port(	clock					: in std_logic; --clock
			RW						: in std_logic; --write enable
			RR 						: in std_logic; --read enable
			rf_a1, rf_a2, rf_a3		: in std_logic_vector(2 downto 0); --write address
			rf_d3					: in std_logic_vector(15 downto 0); --write input
			rf_d2, rf_d1 			: out std_logic_vector(15 downto 0)); --output lines
		
end registerFile;


architecture struct of registerFile is

subtype reg is std_logic_vector(15 downto 0);
type regArray is array(0 to 7) of reg;
signal RF: regArray; --register file contents
process(clock)
begin
	if rising_edge(clock) then

			if(RW = '1') then		--write register
				RF(to_integer(rf_a3)) <= rf_d3; 
			end if;	  
	end if;
			
end process;			
			
	rf_d2 <= RF(to_integer(rf_a2));
	rf_d1 <= RF(to_integer(rf_a1));
			

end struct;
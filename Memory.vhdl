library ieee;
use ieee.std_logic_1164.all;
use numeric_std.all;

entity Memory is

	port(	clock					: in std_logic; --clock
			MW						: in std_logic; --write enable
			
			mem_a					: in std_logic_vector(7 downto 0); --write address
			mem_d					: std_logic_vector(15 downto 0)); --output lines
		
end Memory;


architecture struct of Memory is

subtype mem is std_logic_vector(15 downto 0);
type memArray is array(0 to 255) of mem;
signal RAM: memArray; --register file contents

process(clock)
begin
	if rising_edge(clock) then
		if(MW = '1') then		--write register
			RAM(to_integer(mem_a)) <= mem_d; 
		end if;	  
			
		mem_d <= RAM(to_integer(mem_a));
	end if;
end process;
end struct;
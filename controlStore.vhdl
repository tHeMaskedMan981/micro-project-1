library ieee;
use ieee.std_logic_1164.all;

ENTITY cu IS PORT (
Clock : IN STD_LOGIC;
-- control input


-- control signals
IRload, PCload, MR, MW,RR,RW,Carry,Zero: OUT STD_LOGIC;

IR: IN STD_LOGIC_VECTOR(15 DOWNTO 12));

END cu;


ARCHITECTURE FSM OF cu IS
TYPE state_type is (s1,);

SIGNAL state: state_type;

output_logic: PROCESS(state)
begin
case state is

--HouseKeeping Task
WHEN s1 =>
IRload <= '1';
PCload <= '1';
MR <= '1';
MW <= '0';
RR <= '0';
RW <= '0';
Carry <= '0';
Zero <= '0';
ALU_en <= '1';
-- R type
WHEN s2 =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '0';
RR <= '1';
RW <= '0';
Carry <= '0';
Zero <= '0';
ALU_en <= '0';

WHEN s3 =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '0';
RR <= '0';
RW <= '0';
Carry <= '1';
Zero <= '1';
ALU_en <= '1';

WHEN s4 =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '0';
RR <= '0';
RW <= '1';
Carry <= '0';
Zero <= '0';
ALU_en <= '0';

WHEN const =>
IRload <= '0';
PCload <= '1';
MR <= '0';
MW <= '0';
RR <= '0';
RW <= '0';
Carry <= '0';
Zero <= '0';
ALU_en <= '0';

-- I Type
WHEN s9 =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '0';
RR <= '0';
RW <= '0';
Carry <= '0';
Zero <= '0';
ALU_en <= '1';

WHEN s10 =>
IRload <= '0';
PCload <= '0';
MR <= '1';
MW <= '0';
RR <= '0';
RW <= '0';
Carry <= '0';
Zero <= '0';
ALU_en <= '0';

WHEN s11 =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '0';
RR <= '0';
RW <= '1';
Carry <= '0';
Zero <= '0';
ALU_en <= '0';


WHEN s14 =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '1';
RR <= '0';
RW <= '0';
Carry <= '0';
Zero <= '0';
ALU_en <= '0';


WHEN s17 =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '0';
RR <= '0';
RW <= '1';
Carry <= '0';
Zero <= '0';
ALU_en <= '1';
-----------------------------------------
--J type 


WHEN OTHERS =>
IRload <= '0';
PCload <= '0';
MR <= '0';
MW <= '0';
RR <= '0';
RW <= '0';
Carry <= '0';
Zero <= '0';
ALU_en <= '0';

END CASE;
END PROCESS;

END FSM;
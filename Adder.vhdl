LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIT_ADDER is
        port( a, b, cin         : in  STD_LOGIC;
              sum, cout         : out STD_LOGIC );
end BIT_ADDER;

architecture BHV of BIT_ADDER is
begin

        sum <=  (not a and not b and cin) or
                        (not a and b and not cin) or
                        (a and not b and not cin) or
                        (a and b and cin);

        cout <= (not a and b and cin) or
                        (a and not b and cin) or
                        (a and b and not cin) or
                        (a and b and cin);
end BHV;



------------------------------ add2 ---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY add2 IS
    PORT( a, b  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          cin   : IN  STD_LOGIC;
          ans   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          cout  : OUT STD_LOGIC
    );
END add2;

ARCHITECTURE STRUCTURE OF add2 IS

    COMPONENT BIT_ADDER
        PORT( a, b, cin  : IN  STD_LOGIC;
                sum, cout  : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL c1 : STD_LOGIC;

BEGIN

    b_adder0: BIT_ADDER PORT MAP (a(0), b(0), cin, ans(0), c1);
    b_adder1: BIT_ADDER PORT MAP (a(1), b(1), c1, ans(1), cout);

END STRUCTURE;



------------------------------- add16 ---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY add16 is
    PORT (  a, b : IN  std_logic_vector(15 DOWNTO 0);
            cin  : IN  STD_LOGIC;
            sum1 : OUT std_logic_vector(15 DOWNTO 0);
            cout, zero : OUT std_logic);
END add16;

ARCHITECTURE arch16 OF add16 IS

    COMPONENT add2
        PORT(  a, b      : IN    STD_LOGIC_VECTOR(1 DOWNTO 0);
               cin       : IN    STD_LOGIC;
               ans       : OUT   STD_LOGIC_VECTOR(1 DOWNTO 0);
               cout      : OUT   STD_LOGIC);
    END COMPONENT;

    SIGNAL c1, c2, c3, c4, c5, c6, c7  : std_LOGIC;

BEGIN

    D_adder0: add2 PORT MAP ( a(1  DOWNTO 0)  , b(1 DOWNTO 0)  , cin, sum1(1 DOWNTO 0)   , c1  );
    D_adder1: add2 PORT MAP ( a(3  DOWNTO 2)  , b(3 DOWNTO 2)  , c1 , sum1(3 DOWNTO 2)   , c2  );
    D_adder2: add2 PORT MAP ( a(5  DOWNTO 4)  , b(5 DOWNTO 4)  , c2 , sum1(5 DOWNTO 4)   , c3  );
    D_adder3: add2 PORT MAP ( a(7  DOWNTO 6)  , b(7 DOWNTO 6)  , c3 , sum1(7 DOWNTO 6)   , c4  );
    D_adder4: add2 PORT MAP ( a(9  DOWNTO 8)  , b(9 DOWNTO 8)  , c4 , sum1(9 DOWNTO 8)   , c5  );
    D_adder5: add2 PORT MAP ( a(11 DOWNTO 10) , b(11 DOWNTO 10), c5 , sum1(11 DOWNTO 10) , c6  );
    D_adder6: add2 PORT MAP ( a(13 DOWNTO 12) , b(13 DOWNTO 12), c6 , sum1(13 DOWNTO 12) , c7  );
    D_adder7: add2 PORT MAP ( a(15 DOWNTO 14) , b(15 DOWNTO 14), c7 , sum1(15 DOWNTO 14) , cout);
    zero <= (not (sum1[15] or sum1[14] or sum1[13] or sum1[12] or sum1[11] or sum1[10] or sum1[9] or sum1[8] or sum1[7] or sum1[6] or sum1[5] or sum1[4] or sum1[3] or sum1[2] or sum1[1] or sum1[0])) ;
END arch16;

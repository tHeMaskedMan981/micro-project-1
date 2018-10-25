------------------------------ nand2 ---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY nand2 IS
    PORT( a, b  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          
          ans   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END nand2;

ARCHITECTURE STRUCTURE OF nand2 IS

BEGIN

    ans(0) <= not(a(0) and b(0));
    ans(1) <= not(a(1) and b(1)); 

END STRUCTURE;



------------------------------- nand16 ---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nand16 is
    PORT (  a, b : IN  std_logic_vector(15 DOWNTO 0);
            sum1 : OUT std_logic_vector(15 DOWNTO 0);
            zero : OUT std_logic);
END nand16;

ARCHITECTURE arch16 OF nand16 IS

    COMPONENT nand2
        PORT(  a, b      : IN    STD_LOGIC_VECTOR(1 DOWNTO 0);
               ans       : OUT   STD_LOGIC_VECTOR(1 DOWNTO 0));
    END COMPONENT;

    

BEGIN

    D_nander0: nand2 PORT MAP ( a(1  DOWNTO 0)  , b(1 DOWNTO 0)  , sum1(1 DOWNTO 0)  );
    D_nander1: nand2 PORT MAP ( a(3  DOWNTO 2)  , b(3 DOWNTO 2)  , sum1(3 DOWNTO 2)  );
    D_nander2: nand2 PORT MAP ( a(5  DOWNTO 4)  , b(5 DOWNTO 4)  , sum1(5 DOWNTO 4)  );
    D_nander3: nand2 PORT MAP ( a(7  DOWNTO 6)  , b(7 DOWNTO 6)  , sum1(7 DOWNTO 6)  );
    D_nander4: nand2 PORT MAP ( a(9  DOWNTO 8)  , b(9 DOWNTO 8)  , sum1(9 DOWNTO 8)  );
    D_nander5: nand2 PORT MAP ( a(11 DOWNTO 10) , b(11 DOWNTO 10), sum1(11 DOWNTO 10));
    D_nander6: nand2 PORT MAP ( a(13 DOWNTO 12) , b(13 DOWNTO 12), sum1(13 DOWNTO 12));
    D_nander7: nand2 PORT MAP ( a(15 DOWNTO 14) , b(15 DOWNTO 14), sum1(15 DOWNTO 14));
    zero <= (not (sum1[15] or sum1[14] or sum1[13] or sum1[12] or sum1[11] or sum1[10] or sum1[9] or sum1[8] or sum1[7] or sum1[6] or sum1[5] or sum1[4] or sum1[3] or sum1[2] or sum1[1] or sum1[0])) ;

END arch16;


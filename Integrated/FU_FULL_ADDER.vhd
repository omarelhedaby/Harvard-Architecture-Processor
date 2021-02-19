library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY FU_FULL_ADDER IS
GENERIC (Data_Width : integer := 32);
PORT   (a, b : IN std_logic_vector(Data_Width-1 DOWNTO 0) ;
             cin : IN std_logic;
             s : OUT std_logic_vector(Data_Width-1 DOWNTO 0);
             cout : OUT std_logic);

END FU_FULL_ADDER;


ARCHITECTURE FU_FULL_ADDER_ARCH OF FU_FULL_ADDER IS
         COMPONENT FU_HALF_ADDER IS
                  PORT( a,b,cin : IN std_logic; s,cout : OUT std_logic);
         END COMPONENT;
         SIGNAL temp : std_logic_vector(Data_Width-1 DOWNTO 0);
BEGIN
f0: FU_HALF_ADDER PORT MAP(a(0),b(0),cin,s(0),temp(0));
loop1: FOR i IN 1 TO Data_Width-1 GENERATE
        fx: FU_HALF_ADDER PORT MAP(a(i),b(i),temp(i-1),s(i),temp(i));
END GENERATE;
Cout <= temp(Data_Width-1);
END FU_FULL_ADDER_ARCH;


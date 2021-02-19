LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY BOB_ID_EX_PC IS

	PORT(Clk,Rst,enable : IN std_logic;
	d : IN std_logic_vector(31 DOWNTO 0);
	q : OUT std_logic_vector(31 DOWNTO 0));

END BOB_ID_EX_PC;


ARCHITECTURE BOB_ID_EX_PC_ARCH OF BOB_ID_EX_PC IS

	COMPONENT BOB_BITFF IS

	PORT ( d,Clk,Rst,enable : IN std_logic ;
	q : OUT std_logic);

	END COMPONENT;
	BEGIN
	loop1: FOR i IN 0 TO 31 GENERATE
		fx : BOB_BITFF PORT MAP(d(i),Clk,Rst,enable,q(i));
	END GENERATE;
END BOB_ID_EX_PC_ARCH;
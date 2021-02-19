LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY BOB_EX_MEM_MEM IS

	PORT(Clk,Rst,enable : IN std_logic;
	d : IN std_logic_vector(8 DOWNTO 0);
	q : OUT std_logic_vector(8 DOWNTO 0));

END BOB_EX_MEM_MEM;


ARCHITECTURE BOB_EX_MEM_MEM_ARCH OF BOB_EX_MEM_MEM IS

	COMPONENT BOB_BITFF IS

	PORT ( d,Clk,Rst,enable : IN std_logic ;
	q : OUT std_logic);

	END COMPONENT;
	BEGIN
	loop1: FOR i IN 0 TO 8 GENERATE
		fx : BOB_BITFF PORT MAP(d(i),Clk,Rst,enable,q(i));
	END GENERATE;
END BOB_EX_MEM_MEM_ARCH;
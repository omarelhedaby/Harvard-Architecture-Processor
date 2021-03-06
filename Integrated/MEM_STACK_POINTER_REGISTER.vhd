LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY MEM_STACK_POINTER_REGISTER IS

	PORT(Clk,Rst,enable : IN std_logic;
	d : IN std_logic_vector(10 DOWNTO 0);
	q : OUT std_logic_vector(10 DOWNTO 0));

END MEM_STACK_POINTER_REGISTER;


ARCHITECTURE MEM_STACK_POINTER_REGISTER_ARCH OF MEM_STACK_POINTER_REGISTER IS

	COMPONENT MEM_BITFF IS

	PORT ( d,Clk,Rst,enable : IN std_logic ;
	q : OUT std_logic);

	END COMPONENT;
	BEGIN
	loop1: FOR i IN 0 TO 10 GENERATE
		fx : MEM_BITFF PORT MAP(d(i),Clk,Rst,enable,q(i));
	END GENERATE;
END MEM_STACK_POINTER_REGISTER_ARCH;
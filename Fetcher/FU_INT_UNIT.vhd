LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FU_INT_UNIT IS
	GENERIC(Data_Width : INTEGER := 32); 
	PORT (INT_SIG, clk: IN STD_LOGIC;
	Change_to_INT_Commands: OUT STD_LOGIC;
	Instruction : OUT  STD_LOGIC_VECTOR(Data_Width - 1 DOWNTO 0);
	Reset : IN STD_LOGIC);
END ENTITY FU_INT_UNIT;

--THIS UNIT DOES THE FOLLOWING WHEN THE INT SIGNAL IS INITIATED 
--FIRST IT PRODUCES NOP INSTRUCTION FOR 5 CLOCK CYCLES
--THEN IT PRODUCES THE INT INSTRUCTIONS WHICH TAKES 3 CYCLES 
--SO IN TOTAL THE INT SIGNAL WILL TAKE 8 CLOCK CYCLES TO COMPLETE
--THE WAY IT FUNCTION IS THAT IT TAKES CONTROL OVER THE PIPELINE FETCHING UNIT 
--USING THE INT SIGNAL AS AN INPUT IN THIS UNIT AND AS A SELECTOR FOR THE MUX WHICH HOLDS THE NORMAL INSTRUCTION THAT COMES FORM INSTRUCTION MEMORY 
--MAKING THE CHANGE_TO_INT COMMAND IS THE MUX SELECTOR AND PC STALLER IS THE WAY THAT ENSURES THE STALL OF PIPELINE FOR 8 CLOCK CYCLES
--THE EXPECTED OUTPUT IS THAT THE UNIT WILL PRODUCE 32 BIT OF ZEROS FOR 5 CLOCK CYCLES
--THEN AFTER THAT IT WILL PRODUCE THE CUSTOM INSTRUCTION TO PUSH FLAGS
--THEN AFTER THAT IT WILL PRODUCE THE CUSTOM INSTRUCTION TO POP M[3] & M[2]
--THEN AFTER THAT IT WILL PRODUCE THE CUSTOM INSTRUCTION TO PUSH PC

ARCHITECTURE FU_INT_UNIT_ARCH OF FU_INT_UNIT IS
	SIGNAL Count : INTEGER RANGE 0 TO 9;

BEGIN	
	
	PROCESS(clk, INT_SIG, Count) IS
	BEGIN
		
		
		IF FALLING_EDGE(clk) THEN
			
			IF INT_SIG = '1' OR NOT (Count = 0) THEN 
				IF Count = 0 THEN
					Count <= Count + 1;
					Instruction <= X"00000000";
					Change_to_INT_Commands <= '1';
				ELSIF Count = 1 THEN
					Count <= Count + 1;
					Instruction <= X"00000000";
				ELSIF Count = 2 THEN
					Count <= Count + 1;
					Instruction <= X"00000000";
				ELSIF Count = 3 THEN	
					Count <= Count + 1;
					Instruction <=  X"0000" & "0111010000000000";
				ELSIF Count = 4 THEN	
					Count <= Count + 1;
					Instruction <= X"0000" & "0111000000000000";
				elsif  Count = 5 THEN
					Count <= Count + 1;
					Instruction <= X"0000" & "0111001000000000";	
				ELSIF Count = 6 then 
					Count <= Count + 1;
					Instruction <= X"00000000";
				ELSIF Count = 7 then 
					Count <= Count + 1;
					Instruction <= X"00000000";
				ELSIF Count = 8 then 
					Count <= Count + 1;
					Instruction <= X"00000000";

				END IF;
				IF Count = 9 then 
					Count <= 0;
				END IF;
			END IF;
			IF INT_SIG = '0' AND Count = 0 THEN
				Change_to_INT_Commands <= '0';
			END IF;		
		END IF;

	END PROCESS;     
END FU_INT_UNIT_ARCH;
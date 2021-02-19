LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Execute_ZeroExtender IS PORT (
    INST: IN std_logic_vector(31 DOWNTO 16);
    BufferOut: OUT std_logic_vector(31 DOWNTO 0);
    AluOut: OUT std_logic_vector(15 DOWNTO 0)
);
END ENTITY Execute_ZeroExtender;

ARCHITECTURE Execute_ZeroExtender_ARCH OF Execute_ZeroExtender IS 
begin
    BufferOut <= "0000000000000000" & INST;
    AluOut    <= INST;
end Execute_ZeroExtender_ARCH;
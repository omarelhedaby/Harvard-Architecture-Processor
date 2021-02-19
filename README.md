# Harvard-Architecture-Processor
Implementation of Harvard Architecture Processor using VHDL

The processor includes Full Forwarding, Hazard Detection Unit, and Static Branch Prediction (assuming not taken always). The processor is made on a limited set of instructions

Operations Available:
* One Operand ALU (NOP,SETC,CLRC,NOT,DEC,INC,OUT,IN)
* Two Operand ALU (SWAP,ADD,IADD,SUB,AND,OR,SHL,SHR)
* Memory Operations (POP,PUSH,LDD,LDM,STD)
* Branch Operations (JZ,JN,JC,JMP,CALL,RET,RTI)


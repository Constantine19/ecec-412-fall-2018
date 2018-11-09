library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity Control is
	port(
		Opcode: in std_logic_vector(5 downto 0);
		RegDst, Branch, MemRead, MemtoReg, ALUSrc, RegWrite: out std_logic;
		Jump, MemWrite, StackOp, StackPushPop: out std_logic;
		ALUOp: out std_logic_vector(1 downto 0));
end Control;

architecture behav of Control is
begin
	process(Opcode)
	begin
		case Opcode is
			when "000000" =>		-- R-Format
				StackOp <= '0';
				StackPushPop <= '0';
				RegDst <= '1';
				ALUSrc <= '0';
				MemtoReg <= '0';
				RegWrite <= '1';
				MemRead <= '0';
				MemWrite <= '0';
				Branch <= '0';
				Jump <= '0';
				ALUOp <= "10";
			when "100011" =>		-- lw
				StackOp <= '0';
				StackPushPop <= '0';
				RegDst <= '0';
				ALUSrc <= '1';
				MemtoReg <= '1';
				RegWrite <= '1';
				MemRead <= '1';
				MemWrite <= '0';
				Branch <= '0';
				Jump <= '0';
				ALUOp <= "00";
			when "101011" =>		-- sw
				StackOp <= '0';
				StackPushPop <= '0';
				RegDst <= '-';
				ALUSrc <= '1';
				MemtoReg <= '-';
				RegWrite <= '0';
				MemRead <= '0';
				MemWrite <= '1';
				Branch <= '0';
				Jump <= '0';
				ALUOp <= "00";
			when "000100" =>		-- beq
				StackOp <= '0';
				StackPushPop <= '0';
				RegDst <= '-';
				ALUSrc <= '0';
				MemtoReg <= '-';
				RegWrite <= '0';
				MemRead <= '0';
				MemWrite <= '0';
				Branch <= '1';
				Jump <= '0';
				ALUOp <= "01";
			when "000010" =>		-- jump
				StackOp <= '0';
				StackPushPop <= '0';
				RegDst <= '-';
				ALUSrc <= '-';
				MemtoReg <= '-';
				RegWrite <= '0';
				MemRead <= '0';
				MemWrite <= '0';
				Branch <= '0';
				Jump <= '1';
				ALUOp <= "--";
			when "111010" => 		-- push
				StackOp <= '1';
				StackPushPop <= '1';
				RegDst <= '0';
				ALUSrc <= '0';
				MemtoReg <= '0';
				RegWrite <= '0';
				MemRead <= '0';
				MemWrite <= '1';
				Branch <= '0';
				Jump <= '0';
				ALUOp <= "00";
			when "111011" => 		-- pop
				StackOp <= '1';
				StackPushPop <= '0';
				RegDst <= '0';
				ALUSrc <= '1';
				MemtoReg <= '1';
				RegWrite <= '1';
				MemRead <= '1';
				MemWrite <= '0';
				Branch <= '0';
				Jump <= '0';
				ALUOp <= "00";
			when others => NULL;
		end case;
	end process;
end behav;

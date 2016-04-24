LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE WORK.Praticano_VHDL.ALL;

ENTITY filtro_digital IS

PORT (	   	  	 BUTTON: IN   STD_LOGIC;
				  CLK: IN   STD_LOGIC;
		        SAIDA: OUT  STD_LOGIC);
END filtro_digital;
 

ARCHITECTURE behavior OF filtro_digital IS

TYPE AMOSTRA_STATE IS (AMOSTRA,NOT_AMOSTRA);


SIGNAL REG         : STD_LOGIC_VECTOR (8 DOWNTO 1);
SIGNAL CLOCK       : STD_LOGIC;
SIGNAL COUNT	   : INTEGER := 1;
SIGNAL BUTTON_PUSH : AMOSTRA_STATE:= NOT_AMOSTRA;
--CONSTANT MAX       : INTEGER := 833250;
CONSTANT MAX       : INTEGER := 2;

BEGIN

		FF1 : flip_flop_d PORT MAP (BUTTON,CLOCK,REG(8),OPEN);
		FF2 : flip_flop_d PORT MAP (REG(8),CLOCK,REG(7),OPEN);
		FF3 : flip_flop_d PORT MAP (REG(7),CLOCK,REG(6),OPEN);
		FF4 : flip_flop_d PORT MAP (REG(6),CLOCK,REG(5),OPEN);
		FF5 : flip_flop_d PORT MAP (REG(5),CLOCK,REG(4),OPEN);
		FF6 : flip_flop_d PORT MAP (REG(4),CLOCK,REG(3),OPEN);
		FF7 : flip_flop_d PORT MAP (REG(3),CLOCK,REG(2),OPEN);
		FF8 : flip_flop_d PORT MAP (REG(2),CLOCK,REG(1),OPEN);
 
PROCESS (CLK,BUTTON)
BEGIN
	 IF (RISING_EDGE(CLK)) THEN
		CASE BUTTON_push IS
			WHEN amostra =>
				CLOCK <= '1'; 
			
				IF (reg = "11111111") THEN
					SAIDA <= '1';
				ELSIF (reg = "00000000") THEN
					SAIDA <= '0';
				END IF;
				
				BUTTON_push <= not_amostra;
			WHEN not_amostra =>
				CLOCK <= '0';
			
				COUNT<=COUNT + 1;
				
				IF (COUNT = MAX - 1) THEN
					COUNT <= 0;
					BUTTON_push <= amostra;
				END IF;
		END CASE;
	END IF;
END PROCESS; 

END behavior;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY BUTTON_PRESS IS
	GENERIC (MAX: INTEGER:= 33330000;
		  ONDUTY: INTEGER:= 33330000);
	PORT (CLK: IN   STD_LOGIC;
		  LED: OUT  STD_LOGIC);
END BUTTON_PRESS;

ARCHITECTURE behavior OF BUTTON_PRESS IS
	
	SIGNAL   count : INTEGER   := 0;
	SIGNAL   count_A : INTEGER   := 0;
	SIGNAL   ONS  : STD_LOGIC := '0';
	
	BEGIN
		 
	PROCESS (clk,count)
		BEGIN                                                     
			IF (RISING_EDGE(CLK)) THEN			 
				count <= count + 1;                               
				IF (count = MAX-1) THEN
					LED <= '1';
					ONS <= '1';
				END IF;
				IF (ONS = '1') THEN
					count_a <= count_a + 1;                        
					IF (count_a =  ONDUTY - 1) THEN
						LED <= '0';                                
						count <= 0;                                
						count_a <= 0;                             
						ONS <= '0';                                 
					END IF;
				END IF;
			END IF;
	END PROCESS;

END behavior;
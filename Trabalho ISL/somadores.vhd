--___________________________SOMADORES________________________--

--________________MEIO_SOMADOR_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY half_adder IS
PORT (A, B :IN 	STD_LOGIC;
	  Cout, S :OUT STD_LOGIC);
END half_adder;

ARCHITECTURE structural OF half_adder IS

	COMPONENT and2
		PORT ( A, B: IN  STD_LOGIC;
				  X: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT xor2
		PORT ( A, B: IN  STD_LOGIC;
				  X: OUT STD_LOGIC);
	END COMPONENT;

	FOR ALL: and2 USE ENTITY work.and_2(data_flow);
	FOR ALL: xor2 USE ENTITY work.xor_2(data_flow);			

BEGIN

	c1 : xor2 PORT MAP(A,B,S);
	c2 : and2 PORT MAP(A,B,Cout);

END structural;

--_______________SOMADOR_COMPLETO_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY full_adder IS
PORT (A, B, Cin :IN  STD_LOGIC;
	  Cout , S  :OUT STD_LOGIC);
END full_adder;

ARCHITECTURE structural OF full_adder IS

	COMPONENT and2
		PORT ( A, B: IN  STD_LOGIC;
				  X: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT xor2
		PORT ( A, B: IN  STD_LOGIC;
				  X: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT or2
		PORT ( A, B: IN  STD_LOGIC;
				  X: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT xor3
		PORT ( A, B, C: IN  STD_LOGIC;
					 X: OUT STD_LOGIC);
	END COMPONENT;

	FOR ALL: and2 USE ENTITY work.and_2(data_flow);
	FOR ALL: xor2 USE ENTITY work.xor_2(data_flow);			
	FOR ALL:  or2 USE ENTITY work.xor_2(data_flow);
	FOR ALL: xor3 USE ENTITY work.xor_3(data_flow);

	SIGNAL B1,B2,B3 :STD_LOGIC;

BEGIN

	c1 : xor3 PORT MAP(A,B,Cin,S);
	
	c2 : xor2 PORT MAP(A,B,B1);
	c3 : and2 PORT MAP(A,B,B2);
	
	c4 : and2 PORT MAP(B1,Cin,B3);
	c5 :  or2 PORT MAP(B2,B3,Cout);
	
END structural;

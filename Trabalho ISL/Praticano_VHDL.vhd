---------------------------------------------------------------
--___________________________PACKAGE_________________________--
---------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE praticano_VHDL IS

---------------------------------------------------------------
--_____________________PORTAS_BASICAS________________________--
---------------------------------------------------------------
	COMPONENT not_1 IS
		PORT ( A : IN  STD_LOGIC;
			   X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT and_2 IS
		PORT ( A, B : IN  STD_LOGIC;
			      X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT xor_2 IS
		PORT ( A, B : IN  STD_LOGIC;
			      X : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT  or_2 IS
		PORT ( A, B : IN  STD_LOGIC;
			      X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT nand_2 IS
		PORT ( A, B : IN  STD_LOGIC;
			      X : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT xnor_2 IS
		PORT ( A, B : IN  STD_LOGIC;
			      X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT  nor_2 IS
		PORT ( A, B : IN  STD_LOGIC;
			      X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT and_3 IS
		PORT ( A, B, C : IN  STD_LOGIC;
			         X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT xor_3 IS
		PORT ( A, B, C : IN  STD_LOGIC;
			         X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT  or_3 IS
		PORT ( A, B, C : IN  STD_LOGIC;
			         X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT nand_3 IS
		PORT ( A, B, C : IN  STD_LOGIC;
			         X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT xnor_3 IS
		PORT ( A, B, C : IN  STD_LOGIC;
			         X : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT  nor_3 IS
		PORT ( A, B, C : IN  STD_LOGIC;
			         X : OUT STD_LOGIC);
	END COMPONENT;

	
---------------------------------------------------------------
--_________________________FLIP_FLOPS________________________--
---------------------------------------------------------------

	COMPONENT flip_flop_sr_a  IS
		PORT ( S, R, clock : IN  STD_LOGIC;
				  Q, Q_NOT : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT flip_flop_jk_a  IS
		PORT ( J, K, clock : IN  STD_LOGIC;
				  Q, Q_NOT : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT flip_flop_sr_b  IS
		PORT ( S, R, clock : IN  STD_LOGIC;
				  Q, Q_NOT : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT flip_flop_jk_b  IS
		PORT ( J, K, clock : IN  STD_LOGIC;
				  Q, Q_NOT : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT flip_flop_d  IS
	GENERIC ( inertial_delay_time : TIME := 15 ns);
		PORT ( D, clock  : IN  STD_LOGIC;
			    Q, Q_NOT : OUT STD_LOGIC);
	END COMPONENT;
	
---------------------------------------------------------------
--_________________________SOMADORES_________________________--
---------------------------------------------------------------

	COMPONENT half_adder IS
		PORT (A, B : IN STD_LOGIC;
		   Cout, S : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT full_adder IS
		PORT (A, B, Cin : IN  STD_LOGIC;
			  Cout , S  : OUT STD_LOGIC);
	END COMPONENT;
	CONSTANT NUMBER_OF_BITS: INTEGER  := 5;

END praticano_VHDL;




	


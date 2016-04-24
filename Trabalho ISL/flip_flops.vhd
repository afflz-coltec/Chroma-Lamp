--________________FLIP-FLOPS/NIVEL_LOGICO_ALTO________________--

--_________________FF_SR_A_________________________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flip_flop_sr_a  IS
	PORT ( S, R, clock : IN  STD_LOGIC;
	          Q, Q_NOT : OUT STD_LOGIC);
END flip_flop_sr_a;

ARCHITECTURE behavior OF flip_flop_sr_a IS
BEGIN
	PROCESS(clock, S, R)
	BEGIN
		IF (clock'EVENT AND clock = '1') THEN
			IF (S = '0' AND R = '0') THEN
				NULL;
			ELSIF (S = '1') THEN
				Q     <= '1';
				Q_NOT <= '0';
			ELSIF (R = '1') THEN
				Q     <= '0';
				Q_NOT <= '1';		
			ELSIF (S = '1' AND R = '1') THEN
				NULL;
			END IF;
		END IF;
	END PROCESS;
END behavior;
--_________________FF_JK_A_________________________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flip_flop_jk_a  IS
	PORT ( J, K, clock : IN  STD_LOGIC;
	          Q, Q_NOT : OUT STD_LOGIC);
END flip_flop_jk_a;

ARCHITECTURE behavior OF flip_flop_jk_a IS

SIGNAL Q_M,Q_NOT_M:STD_LOGIC;

BEGIN
	PROCESS(clock, J, K)
	BEGIN
		IF (clock'EVENT AND clock = '1') THEN
			IF (J = '0' AND K = '0') THEN
				NULL;
			ELSIF (J = '1') THEN
				Q_M     <= '1';
				Q_NOT_M <= '0';
			ELSIF (K = '1') THEN
				Q_M     <= '0';
				Q_NOT_M <= '1';		
			ELSIF (J = '1' AND K = '1') THEN
				Q_M 	<= NOT Q_M;
				Q_NOT_M	<= NOT Q_NOT_M;
			END IF;
			Q 		<= Q_M;
			Q_NOT 	<= Q_NOT_M;
		END IF;
	END PROCESS;
END behavior;
--________________FLIP-FLOPS/NIVEL_LOGICO_BAIXO_______________--

--_________________FF_SR_B_________________________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flip_flop_sr_b  IS
	PORT ( S, R, clock : IN  STD_LOGIC;
	          Q, Q_NOT : OUT STD_LOGIC);
END flip_flop_sr_b;

ARCHITECTURE behavior OF flip_flop_sr_b IS
BEGIN
	PROCESS(clock, S, R)
	BEGIN
		IF (clock'EVENT AND clock = '1') THEN
			IF (S = '0' AND R = '0') THEN
				NULL;
			ELSIF (S = '0') THEN
				Q     <= '1';
				Q_NOT <= '0';
			ELSIF (R = '0') THEN
				Q     <= '0';
				Q_NOT <= '1';		
			ELSIF (S = '1' AND R = '1') THEN
				NULL;
			END IF;
		END IF;
	END PROCESS;
END behavior;
--_________________FF_JK_B_________________________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flip_flop_jk_b  IS
	PORT ( J, K, clock : IN  STD_LOGIC;
	          Q, Q_NOT : OUT STD_LOGIC);
END flip_flop_jk_b;

ARCHITECTURE behavior OF flip_flop_jk_b IS

SIGNAL Q_M,Q_NOT_M:STD_LOGIC;

BEGIN
	PROCESS(clock, J, K)
	BEGIN
		IF (clock'EVENT AND clock = '1') THEN
			IF (J = '1' AND K = '1') THEN
				NULL;
			ELSIF (J = '0') THEN
				Q_M     <= '1';
				Q_NOT_M <= '0';
			ELSIF (K = '0') THEN
				Q_M     <= '0';
				Q_NOT_M <= '1';		
			ELSIF (J = '0' AND K = '0') THEN
				Q_M 	<= NOT Q_M;
				Q_NOT_M	<= NOT Q_NOT_M;
			END IF;
			Q 		<= Q_M;
			Q_NOT 	<= Q_NOT_M;
		END IF;
	END PROCESS;
END behavior;
--________________FLIP-FLOPS/NIVEL_LOGICO_N.A._________________--

--_________________FF_D____________________________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flip_flop_d  IS
  GENERIC(inertial_delay_time : TIME := 15 ns);
	PORT ( D, clock         : IN  STD_LOGIC;
	       Q, Q_NOT         : OUT STD_LOGIC);
END flip_flop_d;

ARCHITECTURE behavior OF flip_flop_d IS
BEGIN
	PROCESS(clock, D)
	BEGIN
		IF (clock'EVENT AND clock = '1') THEN
			Q 	  <= D     AFTER inertial_delay_time;
			Q_NOT <= NOT D AFTER inertial_delay_time;
		END IF;
	END PROCESS;
END behavior;

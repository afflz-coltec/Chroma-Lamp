LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

PACKAGE pacote IS
	COMPONENT Scale_change IS
		GENERIC (MINIMO_E: INTEGER; --VALOR MINIMO DA ESCALA DE ENTRADA
				 MAXIMO_E: INTEGER;  --VALOR MAXIMO DA ESCALA DE ENTRADA
				 MINIMO_S: INTEGER;  --VALOR MINIMO DA ESCALA DE SAIDA
				 MAXIMO_S: INTEGER); --VALOR MAXIMO DA ESCALA DE SAIDA
		PORT(entrada: STD_LOGIC_VECTOR (7 DOWNTO 0);
			 saida: OUT INTEGER);
	END COMPONENT;
	
	COMPONENT AUTO_PULSE_MOD IS
	GENERIC (PERIOD_W : INTEGER := 6666000);
	PORT (	 ENTRADA : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		   CLOCK : IN STD_LOGIC;
	     PULSE_W : OUT INTEGER);
	END COMPONENT;
	
	COMPONENT conversor_modulador_pulsos IS
		GENERIC (PERIOD_RATIO : INTEGER := 6666000;
				 MINIMO_E : IN INTEGER;  --VALOR MINIMO DA ESCALA DE ENTRADA
				 MAXIMO_E : IN INTEGER;  --VALOR MAXIMO DA ESCALA DE ENTRADA
				 MINIMO_S : IN INTEGER;  --VALOR MINIMO DA ESCALA DE SAIDA
				 MAXIMO_S : IN INTEGER); --VALOR MAXIMO DA ESCALA DE SAIDA
				
		PORT (ENTRADA : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			  PULSE_W : OUT INTEGER);
	END COMPONENT;

	COMPONENT BUTTON_PRESS IS
		GENERIC (MAX : INTEGER:= 33330000;
			  ONDUTY : INTEGER:= 33330000);
		PORT (CLK: IN   STD_LOGIC;
			  LED: OUT  STD_LOGIC);
	END COMPONENT;
	
	COMPONENT ADC_INTERFACE IS
	PORT 	(
			RESET			      : IN STD_LOGIC;				-- System reset
			CLK_260KHZ		  : IN STD_LOGIC;				-- External clock for ADC
			NADC_ACCESS		  : IN STD_LOGIC;	
			ADC_CSN			    : OUT STD_LOGIC;			-- Not Chip Select (tied to '0')
			ADC_CNTRL_DATA	: OUT STD_LOGIC;			-- DIN signal to ADC
			ADC_DATA		    : IN STD_LOGIC;				-- DOUT signal from ADC
			ADC_SSTRB		    : IN STD_LOGIC;				-- Strobe output from ADC
			ADC_SHDN		    : OUT STD_LOGIC;			-- Three level Shutdown for ADC
			ADC_ADDRESS		  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)		--Address for UFM
			);
	END COMPONENT;
	
	COMPONENT contador_clk IS
		GENERIC (valor_maximo: INTEGER := (33330000-1));
		PORT(clk: IN STD_LOGIC;
			 led: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT PWM IS
		GENERIC (MAX_PERIODO : INTEGER);

		PORT (CLK: IN   STD_LOGIC;
			  MAX_DUTY: IN   INTEGER;
			  SAIDA: OUT  STD_LOGIC);
	END COMPONENT;

	COMPONENT filtro_digital IS
		PORT (BUTTON: IN   STD_LOGIC;
			  CLK: IN   STD_LOGIC;
		      SAIDA: OUT  STD_LOGIC);
	END COMPONENT;
END PACKAGE;
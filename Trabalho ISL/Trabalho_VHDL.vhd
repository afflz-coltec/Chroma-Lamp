LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.pacote.ALL; 

ENTITY Trabalho_VHDL IS
	PORT (switch1: IN STD_LOGIC;
		  switch2: IN STD_LOGIC;
		  switch3: IN STD_LOGIC;
		  switch4: IN STD_LOGIC;
		  clk: IN STD_LOGIC; 
		  CLK_ADC: OUT STD_LOGIC;		        -- External clock for ADC
		  ADC_CSN: OUT STD_LOGIC;               -- Not Chip Select (tied to '0')
		  ADC_CNTRL_DATA: OUT STD_LOGIC;		-- DIN signal to ADC
		  ADC_DATA: IN STD_LOGIC;		        -- DOUT signal from ADC
		  ADC_SSTRB: IN STD_LOGIC;		        -- Strobe output from ADC
		  ADC_SHDN: OUT STD_LOGIC;		        -- Three level Shutdown for ADC 
		  led_vermelho: OUT STD_LOGIC;
		  led_azul: OUT STD_LOGIC;
		  led_amarelo: OUT STD_LOGIC;
		  led_verde: OUT STD_LOGIC);
		 
END Trabalho_VHDL;
 


ARCHITECTURE arch OF Trabalho_VHDL IS
		
CONSTANT periodo_led: INTEGER := 1333200; --para simular, usar 64
CONSTANT const_smp: INTEGER := 24;  --número de clocks necessário para a medição do ADC. Na dúvida, olhar o protocolo
CONSTANT const_adc: INTEGER := 128;

SIGNAL saida_adc_integer: INTEGER;      --para ir para o pwm   (para simular, colocar 4)

SIGNAL clock_adc: STD_LOGIC;    --clock dividido para mandar para o adc
SIGNAL pulso_switch: STD_LOGIC; --faz um pulso para mandar como se estivesse apertando o botão
	
SIGNAL saida_pwm: STD_LOGIC; --saída do pwm, que vai para os leds
	
SIGNAL saida_adc: STD_LOGIC_VECTOR (7 DOWNTO 0); --para simular colocar := "00000100";
	
SIGNAL switch1_digital: STD_LOGIC; --saída do filtro digital do botao 1
SIGNAL switch2_digital: STD_LOGIC; --saída do filtro digital do botao 2
SIGNAL switch3_digital: STD_LOGIC; --saída do filtro digital do botao 3
SIGNAL switch4_digital: STD_LOGIC; --saída do filtro digital do botao 4

SIGNAL temp_azul: STD_LOGIC;
SIGNAL temp_amarelo: STD_LOGIC;
SIGNAL temp_vermelho: STD_LOGIC;
SIGNAL temp_verde: STD_LOGIC;

BEGIN

------------------------------------------COMPONENTES RELACIONADOS AO ADC---------------------------------------------------

	ISL1: contador_clk GENERIC MAP (const_adc) PORT MAP (clk, clock_adc); --divide o clk para ir para o adc
	BTP1: button_press GENERIC MAP (const_smp,1)  PORT MAP (clock_adc,pulso_switch); --divide o clock para mandar como o switch
	ADC1: adc_interface PORT MAP (NOT pulso_switch, clock_adc, '1', adc_csn, adc_cntrl_data,adc_data,adc_sstrb,adc_shdn,saida_adc); -- lembrar que é NOT pulso switch porque o fpga trabalha com lógia inversa, ou seja, 1 é solto e 0 apertado
	
-----------------------------------COMPONENTES RELACIONADOS AO FILTRO DIGITAL------------------------------------------------

--	F1: filtro_digital PORT MAP (switch1, clk, switch1_digital);
--	F2: filtro_digital PORT MAP (switch2, clk, switch2_digital);
--	F3: filtro_digital PORT MAP (switch3, clk, switch3_digital);
--	F4: filtro_digital PORT MAP (switch4, clk, switch4_digital);
			
------------------------------------------COMPONENTES RELACIONADOS AO PWM----------------------------------------------------

	APM1: auto_pulse_mod GENERIC MAP (periodo_led) PORT MAP (saida_adc,clock_adc, saida_adc_integer); --muda de std_logic_vector para integer para ir para o pwm
	
	PWM1: pwm GENERIC MAP (periodo_led) PORT MAP (clk, saida_adc_integer, saida_pwm);
	
-----------------------------------------------MANDAR O CLK PARA O ADC--------------------------------------------------------

	clk_adc <= clock_adc;

--------------------------------------------------DEMULTIPLEXADOR-------------------------------------------------------------

	PROCESS (clk)
	BEGIN
		IF (RISING_EDGE(clk))THEN		
			IF (switch4 = '1') THEN --solto
				IF (switch3 = '0') THEN  --apertado, controla um led por vez
					IF (switch1 = '1' AND switch2 = '1') THEN --switch1 e switch2 soltos, potenciometro muda o vermelho
						temp_vermelho <= saida_pwm;
						temp_amarelo <= '0';
						temp_azul <= '0';
						temp_verde <= '0';
						
					ELSIF (switch1 = '1' AND switch2= '0') THEN --switch1 solto e switch2 apertado, potenciometro muda o azul
						temp_azul <= saida_pwm;
						temp_amarelo <= '0';
						temp_vermelho <= '0';
						temp_verde <= '0';
						
					ELSIF (switch1= '0' AND switch2= '1') THEN --switch1 apertado e switch2 solto, potenciometro muda o verde
						temp_verde <= saida_pwm;
						temp_amarelo <= '0';
						temp_azul <= '0';
						temp_vermelho <= '0';
					
					ELSIF (switch1 = '0' AND switch2 = '0') THEN --switch1 e switch2 apertados, potenciometro muda o amarelo
						temp_amarelo <= saida_pwm;
						temp_vermelho <= '0';
						temp_azul <= '0';
						temp_verde <= '0';
					END IF;
				END IF;
				
			ELSIF (switch4 = '0') THEN  --apertado
				IF (switch3 = '0') THEN  --apertado
			
					temp_vermelho <= saida_pwm;
					temp_azul <= saida_pwm;
					temp_verde <= saida_pwm;
					temp_amarelo <= saida_pwm;
					
				ELSIF (switch3 = '1') THEN --solto
			
					temp_vermelho <= saida_pwm;
					temp_azul <= NOT saida_pwm;
					temp_verde <= saida_pwm;
					temp_amarelo <= NOT saida_pwm;
					
				END IF;
			END IF;	
		END IF;
	END PROCESS;
			
--------------------------------------------------LEDS RECEBEM SUAS TEMPS-------------------------------------------------------

	led_vermelho <= temp_vermelho;
	led_azul <= temp_azul;
	led_amarelo <= temp_amarelo;
	led_verde <= temp_verde;
	
--------------------------------------------------------------------------------------------------------------------------------
	
END arch;
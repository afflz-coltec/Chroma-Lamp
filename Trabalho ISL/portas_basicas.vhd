---------------------------------------------------------------
--________________PORTAS BASICAS/UMA ENTRADA_________________--
---------------------------------------------------------------

--___________________________NOT/UMA ENTRADA_________________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY not_1 IS
	PORT ( A: IN  STD_LOGIC;
		   X: OUT STD_LOGIC);
END not_1;

ARCHITECTURE data_flow OF not_1 IS
BEGIN

X <= NOT A;

END data_flow;

---------------------------------------------------------------
--________________PORTAS BASICAS/DUAS ENTRADAS_______________--
---------------------------------------------------------------


--___________________________AND/DUAS ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and_2 IS
	PORT ( A, B: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END and_2;

ARCHITECTURE data_flow OF and_2 IS
BEGIN

X <= A AND B;

END data_flow;

--___________________________XOR/DUAS ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_2 IS
	PORT ( A, B: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END xor_2;

ARCHITECTURE data_flow OF xor_2 IS
BEGIN

X <= A XOR B;

END data_flow;

--____________________________OR/DUAS ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY or_2 IS
	PORT ( A, B: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END or_2;

ARCHITECTURE data_flow OF or_2 IS
BEGIN

X <= A OR B;

END data_flow;

--__________________________NAND/DUAS ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand_2 IS
	PORT ( A, B: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END nand_2;

ARCHITECTURE data_flow OF nand_2 IS
BEGIN

X <= NOT(A AND B);

END data_flow;
--_________________________XNOR/DUAS ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xnor_2 IS
	PORT ( A, B: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END xnor_2;

ARCHITECTURE data_flow OF xnor_2 IS
BEGIN

X <= NOT(A XOR B);

END data_flow;
--__________________________NOR/DUAS ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nor_2 IS
	PORT ( A, B: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END nor_2;

ARCHITECTURE data_flow OF nor_2 IS
BEGIN

X <= NOT(A OR B);

END data_flow;

---------------------------------------------------------------
--________________PORTAS BASICAS/TRES ENTRADAS_______________--
---------------------------------------------------------------


--___________________________AND/TRES ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and_3 IS
	PORT ( A, B, C: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END and_3;

ARCHITECTURE data_flow OF and_3 IS
BEGIN

X <= A AND B AND C;

END data_flow;

--___________________________XOR/TRES ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_3 IS
	PORT ( A, B, C: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END xor_3;

ARCHITECTURE data_flow OF xor_3 IS
BEGIN

X <= A XOR B XOR C;

END data_flow;

--____________________________OR/TRES ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY or_3 IS
	PORT ( A, B, C: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END or_3;

ARCHITECTURE data_flow OF or_3 IS
BEGIN

X <= A OR B OR C;

END data_flow;

--__________________________NAND/TRES ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand_3 IS
	PORT ( A, B, C: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END nand_3;

ARCHITECTURE data_flow OF nand_3 IS
BEGIN

X <= NOT(A AND B AND C);

END data_flow;
--_________________________XNOR/TRES ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xnor_3 IS
	PORT ( A, B , C: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END xnor_3;

ARCHITECTURE data_flow OF xnor_3 IS
BEGIN

X <= NOT(A XOR B XOR C);

END data_flow;
--__________________________NOR/TRES ENTRADAS_______________--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nor_3 IS
	PORT ( A, B , C: IN  STD_LOGIC;
			  X: OUT STD_LOGIC);
END nor_3;

ARCHITECTURE data_flow OF nor_3 IS
BEGIN

X <= NOT(A OR B OR C);

END data_flow;













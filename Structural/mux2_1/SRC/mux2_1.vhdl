LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY mux2_1 IS
    PORT (
        a, b, sel : IN STD_LOGIC;
        z : OUT STD_LOGIC
    );
END mux2_1;
ARCHITECTURE struct OF mux2_1 IS
BEGIN
    z <= (a AND (NOT sel)) OR (b AND sel);
END ARCHITECTURE;
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY test_mux2_1 IS

END test_mux2_1;

ARCHITECTURE test OF test_mux2_1 IS

    COMPONENT mux2_1 IS
        PORT (
            a, b, sel : IN STD_LOGIC;
            z : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : mux2_1 USE ENTITY work.mux2_1(struct);
    SIGNAL a, b, sel, z : STD_LOGIC;
BEGIN
    uut : mux2_1 PORT MAP(
        a => a,
        b => b,
        sel => sel,
        z => z
    );

    a <= '1';
    b <= '0';
    sel <= '0', '1' AFTER 20 ns;
END ARCHITECTURE;
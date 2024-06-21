LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY test_d_flip_flop IS
END test_d_flip_flop;

ARCHITECTURE test OF test_d_flip_flop IS

    COMPONENT d_flip_flop IS
        PORT (
            clk, rst, d : IN BIT;
            q, q_bar : OUT BIT
        );
    END COMPONENT;
    FOR ALL : d_flip_flop USE ENTITY work.d_flip_flop(struct);
    SIGNAL clk : BIT := '0';
    SIGNAL rst, d, q, q_bar : BIT;
BEGIN

    uut : d_flip_flop PORT MAP(clk, rst, d, q, q_bar);
    clk <= NOT clk AFTER 5 ns;
    rst <= '1', '0' AFTER 15 ns, '1' AFTER 47 ns, '0' AFTER 58 ns;
    d <= '1', '0' AFTER 25 ns, '1' AFTER 35 ns;
END ARCHITECTURE;
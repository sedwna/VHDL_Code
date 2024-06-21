LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY d_flip_flop IS
    PORT (
        clk, rst, d : IN BIT;
        q, q_bar : OUT BIT

    );
END d_flip_flop;
ARCHITECTURE struct OF d_flip_flop IS
    COMPONENT d_latch IS
        PORT (
            c, rst, d : IN BIT;
            q, q_bar : OUT BIT
        );
    END COMPONENT;
    FOR ALL : d_latch USE ENTITY work.d_latch(struct);
    SIGNAL t, clk_bar : BIT;
BEGIN
    clk_bar <= NOT clk;
    d_latch0 : d_latch PORT MAP(c => clk, rst => rst, d => d, q => t, q_bar => OPEN);
    d_latch1 : d_latch PORT MAP(c => clk_bar, rst => rst, d => t, q => q, q_bar => q_bar);

END ARCHITECTURE;
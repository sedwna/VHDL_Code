LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
ENTITY register_4_bit IS
    PORT (
        clk, rst, we : IN BIT;
        d_in : IN bit_vector(3 DOWNTO 0);
        d_out : OUT bit_vector(3 DOWNTO 0)
    );
END register_4_bit;

ARCHITECTURE struct OF register_4_bit IS
    COMPONENT md_ff IS PORT (
        clk, rst, en, d : IN BIT;
        q, q_bar : OUT BIT
        );
    END COMPONENT;

BEGIN
    mdff0 : md_ff PORT MAP(
        clk => clk, rst => rst, en => we, d => d_in(0), q => d_out(0), q_bar => OPEN
    );
    mdff1 : md_ff PORT MAP(
        clk => clk, rst => rst, en => we, d => d_in(1), q => d_out(1), q_bar => OPEN
    );
    mdff2 : md_ff PORT MAP(
        clk => clk, rst => rst, en => we, d => d_in(2), q => d_out(2), q_bar => OPEN
    );
    mdff3 : md_ff PORT MAP(
        clk => clk, rst => rst, en => we, d => d_in(3), q => d_out(3), q_bar => OPEN
    );

END ARCHITECTURE;
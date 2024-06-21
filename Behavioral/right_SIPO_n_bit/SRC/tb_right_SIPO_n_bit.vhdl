
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_right_SIPO_n_bit IS
    GENERIC (size : INTEGER := 4);
END test_right_SIPO_n_bit;

ARCHITECTURE test OF test_right_SIPO_n_bit IS

    COMPONENT right_SIPO_n_bit
        GENERIC (size : INTEGER := 4);
        PORT (
            clk, rst, en, si : IN STD_LOGIC;
            d_out : OUT STD_LOGIC_VECTOR (size - 1 DOWNTO 0));
    END COMPONENT;
    FOR ALL : right_SIPO_n_bit USE ENTITY work.right_SIPO_n_bit(behavioral);
    SIGNAL clk, si : STD_LOGIC := '0';
    SIGNAL rst, en : STD_LOGIC;
    SIGNAL d_out : STD_LOGIC_VECTOR (size - 1 DOWNTO 0);

BEGIN
    uut : right_SIPO_n_bit GENERIC MAP(size)PORT MAP(clk, rst, en, si, d_out);

    clk <= NOT clk AFTER 5 ns;
    rst <= '1', '0' AFTER 10 ns;
    en <= '1', '0' AFTER 40 ns, '1' AFTER 70 ns, '0' AFTER 120 ns;
    si <= NOT si AFTER 2 ns;

END ARCHITECTURE;
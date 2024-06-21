LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_register_n_bit IS
    GENERIC (size : INTEGER := 4);

END test_register_n_bit;

ARCHITECTURE test OF test_register_n_bit IS

    COMPONENT register_n_bit IS
        GENERIC (size : INTEGER := 4);
        PORT (
            clk, rst, we : IN STD_LOGIC;
            d_in : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
            d_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)

        );
    END COMPONENT;
    FOR ALL : register_n_bit USE ENTITY work.register_n_bit(behavioral);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, we : STD_LOGIC;
    SIGNAL d_in, d_out : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
BEGIN
    uut : register_n_bit GENERIC MAP(size)PORT MAP(clk, rst, we, d_in, d_out);
    clk <= NOT clk AFTER 5 ns;
    rst <= '1', '0' AFTER 25 ns, '1' AFTER 135 ns, '0' AFTER 145 ns;
    we <= '0', '1' AFTER 15 ns, '0' AFTER 35 ns, '1' AFTER 95 ns, '0' AFTER 105 ns;
    d_in <= X"1", X"2" AFTER 15 ns, X"3" AFTER 25 ns, X"4" AFTER 35 ns, X"5" AFTER 45 ns, X"6" AFTER 55 ns, X"7" AFTER 65 ns, X"8" AFTER 75 ns, X"9" AFTER 85 ns, X"A" AFTER 95 ns, X"B" AFTER 105 ns, X"C" AFTER 115 ns, X"D" AFTER 125 ns, X"E" AFTER 135 ns, X"F" AFTER 145 ns;
END ARCHITECTURE;
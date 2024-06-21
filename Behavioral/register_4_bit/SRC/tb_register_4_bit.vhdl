LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_reg_4_bit IS
END test_reg_4_bit;

ARCHITECTURE test OF test_reg_4_bit IS

    COMPONENT reg_4_bit IS
        PORT (
            clk, rst, we : IN STD_LOGIC;
            d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            d_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

        );
    END COMPONENT;
    FOR ALL : reg_4_bit USE ENTITY work.reg_4_bit(behavioral);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, we : STD_LOGIC;
    SIGNAL d_in, d_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    uut : reg_4_bit PORT MAP(clk, rst, we, d_in, d_out);
    clk <= NOT clk AFTER 5 ns;
    rst <= '1', '0' AFTER 25 ns, '1' AFTER 135 ns, '0' AFTER 145 ns;
    we <= '0', '1' AFTER 15 ns, '0' AFTER 35 ns, '1' AFTER 95 ns, '0' AFTER 105 ns;
    d_in <= X"1", X"2" AFTER 15 ns, X"3" AFTER 25 ns, X"4" AFTER 35 ns, X"5" AFTER 45 ns, X"6" AFTER 55 ns, X"7" AFTER 65 ns, X"8" AFTER 75 ns, X"9" AFTER 85 ns, X"A" AFTER 95 ns, X"B" AFTER 105 ns, X"C" AFTER 115 ns, X"D" AFTER 125 ns, X"E" AFTER 135 ns, X"F" AFTER 145 ns;
END ARCHITECTURE;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test_seq_det_1011_mealy IS
END test_seq_det_1011_mealy;

ARCHITECTURE test OF test_seq_det_1011_mealy IS
    COMPONENT seq_det_1011_mealy IS
        PORT (
            clk, rst, d : IN STD_LOGIC;
            det : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : seq_det_1011_mealy USE ENTITY work.seq_det_1011_mealy(behavioral);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, d, det : STD_LOGIC;
BEGIN
    uut : seq_det_1011_mealy PORT MAP(clk, rst, d, det);
    clk <= NOT clk AFTER 5 NS;
    rst <= '1', '0' AFTER 20 NS, '1' AFTER 140 ns, '0' AFTER 160 ns;
    d <= '0', '1' AFTER 40 ns, '0' AFTER 70 ns, '1' AFTER 80 ns, '0' AFTER 100 ns, '1' AFTER 110 ns, '0' AFTER 140 ns, '1' AFTER 150 ns, '0' AFTER 170 ns;

END ARCHITECTURE;
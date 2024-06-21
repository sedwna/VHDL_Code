LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator_n_bit_generate IS
    GENERIC (size : INTEGER := 4);
    PORT (
        a, b STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
        gt, eq, lt : IN STD_LOGIC;
        a_gt_b, a_eq_b, a_lt_b : OUT STD_LOGIC

    );
END comparator_n_bit_generate;

ARCHITECTURE struct OF comparator_n_bit_generate IS

    COMPONENT bit_comparator IS
        PORT (
            a, b, gt, eq, lt : IN STD_LOGIC;
            a_gt_b, a_eq_b, a_lt_b : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : bit_comparator USE ENTITY work.bit_comparator(struct);
    SIGNAL t : STD_LOGIC_VECTOR(((3 * n + 3) - 1) DOWNTO 0);
BEGIN
    gen0 : FOR i IN 0 TO (size - 1) GENERATE
        compare : bit_comparator PORT MAP(
            a => a(i),
            b => b(i),
            gt => t(3 * i + 3),
            eq => t(3 * i + 4),
            lt => t(3 * i + 5),
            a_gt_b => t(3 * i),
            a_eq_b => t(3 * i + 1),
            a_lt_b => t(3 * i + 2)

        );

    END GENERATE;

    a_gt_b <= t(0);
    a_eq_b <= t(1);
    a_lt_b <= t(2);
    t(((3 * n + 3) - 3)) <= gt;
    t(((3 * n + 3) - 2)) <= eq;
    t(((3 * n + 3) - 1)) <= lt;
END ARCHITECTURE;
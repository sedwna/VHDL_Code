LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit_comparator IS
    PORT (
        a, b, gt, eq, lt : IN STD_LOGIC;
        a_gt_b, a_eq_b, a_lt_b : OUT STD_LOGIC

    );
END bit_comparator;

ARCHITECTURE struct OF bit_comparator IS

BEGIN
    a_gt_b <= gt OR (eq AND a AND(NOT b));
    a_eq_b <= eq AND(((NOT a) AND (NOT b)) OR (a AND b));
    a_lt_b <= lt OR(eq AND(NOT a)AND b);
END ARCHITECTURE;
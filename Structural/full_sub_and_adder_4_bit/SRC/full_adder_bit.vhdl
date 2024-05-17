LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_bit IS
    PORT (
        a, b, c : IN STD_LOGIC;
        sum, carry : OUT STD_LOGIC
    );
END full_adder_bit;

ARCHITECTURE struct OF full_adder_bit IS

BEGIN
    sum <= a XOR b XOR c;
    carry <= (a AND b) OR (b AND c) OR (c AND a);
END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
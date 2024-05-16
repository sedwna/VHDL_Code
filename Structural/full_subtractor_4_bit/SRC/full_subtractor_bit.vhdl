LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_subtractor_bit IS
    PORT (
        a, b, barrow_in : IN STD_LOGIC;
        diff, barrow : OUT STD_LOGIC
    );
END full_subtractor_bit;

ARCHITECTURE struct OF full_subtractor_bit IS

BEGIN
    diff <= a XOR b XOR barrow_in;
    barrow <= ((NOT a) AND b) OR (b AND barrow_in) OR (barrow_in AND (NOT a));
END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
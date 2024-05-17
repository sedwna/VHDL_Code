LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_subtractor_4_bit IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        barrow_in : IN STD_LOGIC;
        diff : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        barrow : OUT STD_LOGIC
    );
END full_subtractor_4_bit;

ARCHITECTURE struct OF full_subtractor_4_bit IS

    COMPONENT full_subtractor_bit IS
        PORT (
            a, b, barrow_in : IN STD_LOGIC;
            diff, barrow : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : full_subtractor_bit USE ENTITY work.full_subtractor_bit(struct);

    SIGNAL zero : STD_LOGIC := '0';
    SIGNAL b1 : STD_LOGIC := '0';
    SIGNAL b2 : STD_LOGIC := '0';
    SIGNAL b3 : STD_LOGIC := '0';
    SIGNAL b4 : STD_LOGIC := '0';

BEGIN
    fs0 : full_subtractor_bit PORT MAP(
        a => a(0),
        b => b(0),
        barrow_in => zero,
        diff => diff(0),
        barrow => b1
    );
    fs1 : full_subtractor_bit PORT MAP(
        a => a(1),
        b => b(1),
        barrow_in => b1,
        diff => diff(1),
        barrow => b2
    );
    fs2 : full_subtractor_bit PORT MAP(
        a => a(2),
        b => b(2),
        barrow_in => b2,
        diff => diff(2),
        barrow => b3
    );
    fs3 : full_subtractor_bit PORT MAP(
        a => a(3),
        b => b(3),
        barrow_in => b3,
        diff => diff(3),
        barrow => b4
    );
    barrow <= b4;

END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
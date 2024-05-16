LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_4_bit IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        c : IN STD_LOGIC;
        sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        carry : OUT STD_LOGIC
    );
END full_adder_4_bit;

ARCHITECTURE struct OF full_adder_4_bit IS

    COMPONENT full_adder_bit IS
        PORT (
            a, b, c : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : full_adder_bit USE ENTITY work.full_adder_bit(struct);

    SIGNAL zero : STD_LOGIC := '0';
    SIGNAL c1 : STD_LOGIC := '0';
    SIGNAL c2 : STD_LOGIC := '0';
    SIGNAL c3 : STD_LOGIC := '0';
    SIGNAL c4 : STD_LOGIC := '0';

BEGIN
    fa0 : full_adder_bit PORT MAP(
        a => a(0),
        b => b(0),
        c => zero,
        sum => sum(0),
        carry => c1
    );
    fa1 : full_adder_bit PORT MAP(
        a => a(1),
        b => b(1),
        c => c1,
        sum => sum(1),
        carry => c2
    );
    fa2 : full_adder_bit PORT MAP(
        a => a(2),
        b => b(2),
        c => c2,
        sum => sum(2),
        carry => c3
    );
    fa3 : full_adder_bit PORT MAP(
        a => a(3),
        b => b(3),
        c => c3,
        sum => sum(3),
        carry => c4
    );
    carry <= c4;

END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
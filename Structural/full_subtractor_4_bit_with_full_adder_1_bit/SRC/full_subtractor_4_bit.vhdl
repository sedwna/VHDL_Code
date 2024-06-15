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

    COMPONENT full_adder_bit IS
        PORT (
            a, b, c : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : full_adder_bit USE ENTITY work.full_adder_bit(struct);

    SIGNAL zero : STD_LOGIC := '0';
    SIGNAL b1 : STD_LOGIC ;
    SIGNAL b2 : STD_LOGIC ;
    SIGNAL b3 : STD_LOGIC ;
    SIGNAL b4 : STD_LOGIC ;

BEGIN
    fa0 : full_adder_bit PORT MAP(
        a => a(0),
        b => b(0),
        c => zero,
        sum => diff(0),
        carry => b1
    );
    fa1 : full_adder_bit PORT MAP(
        a => a(1),
        b => b(1),
        c => b1,
        sum => diff(1),
        carry => b2
    );
    fa2 : full_adder_bit PORT MAP(
        a => a(2),
        b => b(2),
        c => b2,
        sum => diff(2),
        carry => b3
    );
    fa3 : full_adder_bit PORT MAP(
        a => a(3),
        b => b(3),
        c => b3,
        sum => diff(3),
        carry => b4
    );
    barrow <= b4;

END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
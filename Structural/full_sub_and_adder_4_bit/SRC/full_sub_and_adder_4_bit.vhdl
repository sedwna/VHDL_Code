LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_sub_and_adder_4_bit IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        m : IN STD_LOGIC;
        result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        c_out : OUT STD_LOGIC
    );
END full_sub_and_adder_4_bit;

ARCHITECTURE struct OF full_sub_and_adder_4_bit IS

    COMPONENT full_adder_bit IS
        PORT (
            a, b, c : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : full_adder_bit USE ENTITY work.full_adder_bit(struct);

    SIGNAL c1 : STD_LOGIC := '0';
    SIGNAL c2 : STD_LOGIC := '0';
    SIGNAL c3 : STD_LOGIC := '0';
    SIGNAL c4 : STD_LOGIC := '0';
    SIGNAL temp : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    temp(0) <= b(0) XOR m;
    temp(1) <= b(1) XOR m;
    temp(2) <= b(2) XOR m;
    temp(3) <= b(3) XOR m;

    fa0 : full_adder_bit PORT MAP(
        a => a(0),
        b => temp(0),
        c => m,
        sum => result(0),
        carry => c1
    );
    fa1 : full_adder_bit PORT MAP(
        a => a(1),
        b => temp(1),
        c => c1,
        sum => result(1),
        carry => c2
    );
    fa2 : full_adder_bit PORT MAP(
        a => a(2),
        b => temp(2),
        c => c2,
        sum => result(2),
        carry => c3
    );
    fa3 : full_adder_bit PORT MAP(
        a => a(3),
        b => temp(3),
        c => c3,
        sum => result(3),
        carry => c4
    );
    c_out <= c4;

END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
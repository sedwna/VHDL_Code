LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_n_bit IS
    GENERIC (size : INTEGER := 4);
    PORT (
        a, b : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
        cin : IN STD_LOGIC;
        sum : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
        cout : OUT STD_LOGIC
    );
END full_adder_n_bit;

ARCHITECTURE struct OF full_adder_n_bit IS

    COMPONENT full_adder IS
        PORT (
            a, b, cin : IN STD_LOGIC;
            sum, cout : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : full_adder USE ENTITY work.full_adder(struct);

    SIGNAL t : STD_LOGIC_VECTOR (size DOWNTO 0);
BEGIN
    gen0 : FOR i IN 0 TO (size - 1) GENERATE
        fan : full_adder PORT MAP
        (
            a => a(i),
            b => b(i),
            cin => t(i),
            sum => sum(i),
            cout => t(i + 1)
        );
    END GENERATE;
    t(0) <= cin;
    cout <= t(size);

END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
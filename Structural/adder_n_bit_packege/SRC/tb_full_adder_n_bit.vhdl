-- Testbench for full_adder_n_bit ENTITY

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench_full_adder_n_bit IS
    GENERIC (size : INTEGER := 4);
END testbench_full_adder_n_bit;

ARCHITECTURE testbench_full_adder_n_bit OF testbench_full_adder_n_bit IS

    -- Component Declaration
    COMPONENT full_adder_n_bit IS
        GENERIC (size : INTEGER := 4);
        PORT (
            a, b : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
            cin : IN STD_LOGIC;
            sum : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
            cout : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : full_adder_n_bit USE ENTITY work.full_adder_n_bit(struct);
    -- Testbench Signals
    SIGNAL a, b : STD_LOGIC_VECTOR(size - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cin : STD_LOGIC := '0';
    SIGNAL sum : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
    SIGNAL cout : STD_LOGIC;

BEGIN

    -- Instantiate full_adder_n_bit Component
    DUT : full_adder_n_bit
    PORT MAP(
        a => a,
        b => b,
        cin => cin,
        sum => sum,
        cout => cout
    );

    -- Testbench Process
    PROCESS
    BEGIN
        -- Test Case 1
        a <= "0000";
        b <= "0000";
        cin <= '0';
        WAIT FOR 10 ns;

        -- Test Case 2
        a <= "1111";
        b <= "1111";
        cin <= '0';
        WAIT FOR 10 ns;

        -- Test Case 3
        a <= "1010";
        b <= "0101";
        cin <= '0';
        WAIT FOR 10 ns;
        -- Test Case 4
        a <= "1111";
        b <= "0000";
        cin <= '0';
        WAIT FOR 10 ns;
        -- Test Case 5
        a <= "0101";
        b <= "0101";
        cin <= '0';
        WAIT FOR 10 ns;
        -- Test Case 6
        a <= "1001";
        b <= "0011";
        cin <= '0';
        WAIT FOR 10 ns;
        -- Test Case 7
        a <= "1111";
        b <= "1111";
        cin <= '0';
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;

END testbench_full_adder_n_bit;
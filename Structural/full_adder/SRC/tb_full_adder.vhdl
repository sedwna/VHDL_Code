-- Testbench for full_adder_bit ENTITY

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench_full_adder_bit IS
END testbench_full_adder_bit;

ARCHITECTURE testbench_full_adder_bit OF testbench_full_adder_bit IS

    -- Component Declaration
    COMPONENT full_adder_bit
        PORT (
            a, b, c : IN STD_LOGIC;
            sum, carry : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL: full_adder_bit USE ENTITY work.full_adder_bit(struct);


    -- Testbench Signals
    SIGNAL a, b, c : STD_LOGIC := '0';
    SIGNAL sum, carry : STD_LOGIC;

BEGIN

    -- Instantiate full_adder_bit Component
    DUT : full_adder_bit
        PORT MAP (
            a => a,
            b => b,
            c => c,
            sum => sum,
            carry => carry
        );

    -- Testbench Process
    process
    begin
        -- Test Case 1
        a <= '0';
        b <= '0';
        c <= '0';
        wait for 10 ns;
        assert sum = '0' and carry = '0' report "Test Case 1 Passed" severity NOTE;

        -- Test Case 2
        a <= '0';
        b <= '0';
        c <= '1';
        wait for 10 ns;
        assert sum = '1' and carry = '0' report "Test Case 2 Passed" severity NOTE;

        -- Test Case 3
        a <= '0';
        b <= '1';
        c <= '0';
        wait for 10 ns;
        assert sum = '1' and carry = '0' report "Test Case 3 Passed" severity NOTE;

        -- Test Case 4
        a <= '0';
        b <= '1';
        c <= '1';
        wait for 10 ns;
        assert sum = '0' and carry = '1' report "Test Case 4 Passed" severity NOTE;

        -- Test Case 5
        a <= '1';
        b <= '0';
        c <= '0';
        wait for 10 ns;
        assert sum = '1' and carry = '0' report "Test Case 5 Passed" severity NOTE;

        -- Test Case 6
        a <= '1';
        b <= '0';
        c <= '1';
        wait for 10 ns;
        assert sum = '0' and carry = '1' report "Test Case 6 Passed" severity NOTE;

        -- Test Case 7
        a <= '1';
        b <= '1';
        c <= '0';
        wait for 10 ns;
        assert sum = '0' and carry = '1' report "Test Case 7 Passed" severity NOTE;

        -- Test Case 8
        a <= '1';
        b <= '1';
        c <= '1';
        wait for 10 ns;
        assert sum = '1' and carry = '1' report "Test Case 8 Passed" severity NOTE;

        wait;
    end process;

END testbench_full_adder_bit;

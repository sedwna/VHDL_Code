-- Testbench for full_subtractor_bit ENTITY

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench_full_subtractor_bit IS
END testbench_full_subtractor_bit;

ARCHITECTURE testbench_full_subtractor_bit OF testbench_full_subtractor_bit IS

    -- Component Declaration
    COMPONENT full_subtractor_bit
        PORT (
            a, b, barrow_in : IN STD_LOGIC;
            diff, barrow : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Testbench Signals
    SIGNAL a, b, barrow_in : STD_LOGIC := '0';
    SIGNAL diff, barrow : STD_LOGIC;

BEGIN

    -- Instantiate full_subtractor_bit Component
    DUT : full_subtractor_bit
        PORT MAP (
            a => a,
            b => b,
            barrow_in => barrow_in,
            diff => diff,
            barrow => barrow
        );

    -- Testbench Process
    process
    begin
        -- Test Case 1
        a <= '0';
        b <= '0';
        barrow_in <= '0';
        wait for 10 ns;
        assert diff = '0' and barrow = '0' report "Test Case 1 Passed" severity NOTE;

        -- Test Case 2
        a <= '0';
        b <= '0';
        barrow_in <= '1';
        wait for 10 ns;
        assert diff = '1' and barrow = '1' report "Test Case 2 Passed" severity NOTE;

        -- Test Case 3
        a <= '0';
        b <= '1';
        barrow_in <= '0';
        wait for 10 ns;
        assert diff = '1' and barrow = '0' report "Test Case 3 Passed" severity NOTE;

        -- Test Case 4
        a <= '0';
        b <= '1';
        barrow_in <= '1';
        wait for 10 ns;
        assert diff = '0' and barrow = '0' report "Test Case 4 Passed" severity NOTE;

        -- Test Case 5
        a <= '1';
        b <= '0';
        barrow_in <= '0';
        wait for 10 ns;
        assert diff = '1' and barrow = '0' report "Test Case 5 Passed" severity NOTE;

        -- Test Case 6
        a <= '1';
        b <= '0';
        barrow_in <= '1';
        wait for 10 ns;
        assert diff = '0' and barrow = '1' report "Test Case 6 Passed" severity NOTE;

        -- Test Case 7
        a <= '1';
        b <= '1';
        barrow_in <= '0';
        wait for 10 ns;
        assert diff = '0' and barrow = '0' report "Test Case 7 Passed" severity NOTE;

        -- Test Case 8
        a <= '1';
        b <= '1';
        barrow_in <= '1';
        wait for 10 ns;
        assert diff = '1' and barrow = '1' report "Test Case 8 Passed" severity NOTE;

        wait;
    end process;

END testbench_full_subtractor_bit;

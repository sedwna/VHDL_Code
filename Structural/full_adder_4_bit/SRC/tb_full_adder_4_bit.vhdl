-- Testbench for full_adder_4_bit ENTITY

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench_full_adder_4_bit IS
END testbench_full_adder_4_bit;

ARCHITECTURE testbench_full_adder_4_bit OF testbench_full_adder_4_bit IS

    -- Component Declaration
    COMPONENT full_adder_4_bit
        PORT (
            a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            c : IN STD_LOGIC;
            sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            carry : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : full_adder_4_bit USE ENTITY work.full_adder_4_bit(struct);
    -- Testbench Signals
    SIGNAL a, b : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL c : STD_LOGIC := '0';
    SIGNAL sum : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL carry : STD_LOGIC;

BEGIN

    -- Instantiate full_adder_4_bit Component
    DUT : full_adder_4_bit
    PORT MAP(
        a => a,
        b => b,
        c => c,
        sum => sum,
        carry => carry
    );

    -- Testbench Process
    PROCESS
    BEGIN
        -- Test Case 1
        a <= "0000";
        b <= "0000";
        c <= '0';
        WAIT FOR 10 ns;
        ASSERT sum = "0000" AND carry = '0' REPORT "Test Case 1 Passed" SEVERITY NOTE;

        -- Test Case 2
        a <= "1111";
        b <= "1111";
        c <= '0';
        WAIT FOR 10 ns;
        ASSERT sum = "1110" AND carry = '1' REPORT "Test Case 2 Passed" SEVERITY NOTE;

        -- Test Case 3
        a <= "1010";
        b <= "0101";
        c <= '0';
        WAIT FOR 10 ns;
        ASSERT sum = "1111" AND carry = '0' REPORT "Test Case 3 Passed" SEVERITY NOTE;

        -- Test Case 4
        a <= "1111";
        b <= "0000";
        c <= '1';
        WAIT FOR 10 ns;
        ASSERT sum = "1111" AND carry = '1' REPORT "Test Case 4 Passed" SEVERITY NOTE;

        -- Test Case 5
        a <= "0101";
        b <= "0101";
        c <= '1';
        WAIT FOR 10 ns;
        ASSERT sum = "1111" AND carry = '0' REPORT "Test Case 5 Passed" SEVERITY NOTE;

        -- Test Case 6
        a <= "1001";
        b <= "0011";
        c <= '1';
        WAIT FOR 10 ns;
        ASSERT sum = "1101" AND carry = '1' REPORT "Test Case 6 Passed" SEVERITY NOTE;

        -- Test Case 7
        a <= "1111";
        b <= "1111";
        c <= '1';
        WAIT FOR 10 ns;
        ASSERT sum = "1110" AND carry = '1' REPORT "Test Case 7 Passed" SEVERITY NOTE;

        WAIT;
    END PROCESS;

END testbench_full_adder_4_bit;
-- Testbench for full_sub_and_adder_4_bit ENTITY

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench_full_sub_and_adder_4_bit IS
END testbench_full_sub_and_adder_4_bit;

ARCHITECTURE testbench_full_sub_and_adder_4_bit OF testbench_full_sub_and_adder_4_bit IS

    -- Component Declaration
    COMPONENT full_sub_and_adder_4_bit
        PORT (
            a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            m : IN STD_LOGIC;
            result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            c_out : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Testbench Signals
    SIGNAL a, b : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL m : STD_LOGIC := '0';
    SIGNAL result : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL c_out : STD_LOGIC;

BEGIN

    -- Instantiate full_sub_and_adder_4_bit Component
    DUT : full_sub_and_adder_4_bit
        PORT MAP (
            a => a,
            b => b,
            m => m,
            result => result,
            c_out => c_out
        );

    -- Testbench Process
    process
    begin
        -- Test Case 1
        a <= "0000";
        b <= "0000";
        m <= '0';
        wait for 10 ns;
        assert result = "0000" and c_out = '0' report "Test Case 1 Passed" severity NOTE;

        -- Test Case 2
        a <= "1111";
        b <= "1111";
        m <= '0';
        wait for 10 ns;
        assert result = "0000" and c_out = '0' report "Test Case 2 Passed" severity NOTE;

        -- Test Case 3
        a <= "1010";
        b <= "0101";
        m <= '0';
        wait for 10 ns;
        assert result = "1111" and c_out = '0' report "Test Case 3 Passed" severity NOTE;

        -- Test Case 4
        a <= "1111";
        b <= "0000";
        m <= '1';
        wait for 10 ns;
        assert result = "1111" and c_out = '0' report "Test Case 4 Passed" severity NOTE;

        -- Test Case 5
        a <= "0101";
        b <= "0101";
        m <= '1';
        wait for 10 ns;
        assert result = "0000" and c_out = '0' report "Test Case 5 Passed" severity NOTE;

        -- Test Case 6
        a <= "1001";
        b <= "0011";
        m <= '1';
        wait for 10 ns;
        assert result = "1110" and c_out = '1' report "Test Case 6 Passed" severity NOTE;

        -- Test Case 7
        a <= "1111";
        b <= "1111";
        m <= '1';
        wait for 10 ns;
        assert result = "0000" and c_out = '1' report "Test Case 7 Passed" severity NOTE;

        wait;
    end process;

END testbench_full_sub_and_adder_4_bit;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_left_right_shift_reg_4_bit IS
END tb_left_right_shift_reg_4_bit;

ARCHITECTURE behavior OF tb_left_right_shift_reg_4_bit IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT left_right_shift_reg_4_bit
        PORT (
            clk : IN STD_LOGIC;
            s1 : IN STD_LOGIC;
            s2 : IN STD_LOGIC;
            d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            d_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    FOR ALL : left_right_shift_reg_4_bit USE ENTITY work.left_right_shift_reg_4_bit(behavioral);

    -- Inputs
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL s1 : STD_LOGIC := '0';
    SIGNAL s2 : STD_LOGIC := '0';
    SIGNAL d_in : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');

    -- Outputs
    SIGNAL d_out : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Clock period definitions
    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : left_right_shift_reg_4_bit PORT MAP(
        clk => clk,
        s1 => s1,
        s2 => s2,
        d_in => d_in,
        d_out => d_out
    );

    -- Clock process definitions
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        -- hold local data
        s1 <= '0';
        s2 <= '0';
        WAIT FOR clk_period * 2;

        -- load data to shift register
        s1 <= '1';
        s2 <= '1';
        d_in <= "1010";
        WAIT FOR clk_period * 2;

        -- hold local data
        s1 <= '0';
        s2 <= '0';
        WAIT FOR clk_period * 2;

        -- left shift
        s1 <= '1';
        s2 <= '0';
        WAIT FOR clk_period * 2;

        -- hold local data
        s1 <= '0';
        s2 <= '0';
        WAIT FOR clk_period * 2;

        -- right shift
        s1 <= '0';
        s2 <= '1';
        WAIT FOR clk_period * 2;

        -- hold local data
        s1 <= '0';
        s2 <= '0';
        WAIT FOR clk_period * 2;

        -- load new data to shift register
        s1 <= '1';
        s2 <= '1';
        d_in <= "1100";
        WAIT FOR clk_period * 2;

        -- hold local data
        s1 <= '0';
        s2 <= '0';
        WAIT FOR clk_period * 2;

        -- left shift
        s1 <= '1';
        s2 <= '0';
        WAIT FOR clk_period * 2;

        -- right shift
        s1 <= '0';
        s2 <= '1';
        WAIT FOR clk_period * 2;

        -- end simulation
        WAIT;
    END PROCESS;

END;
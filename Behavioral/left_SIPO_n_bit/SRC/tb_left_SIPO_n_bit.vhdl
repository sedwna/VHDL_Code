LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_left_SIPO_n_bit IS
END tb_left_SIPO_n_bit;

ARCHITECTURE tb OF tb_left_SIPO_n_bit IS

    COMPONENT left_SIPO_n_bit
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            en : IN STD_LOGIC;
            si : IN STD_LOGIC;
            d_out : out STD_LOGIC_VECTOR (size - 1 DOWNTO 0));
    END COMPONENT;
    FOR ALL : left_SIPO_n_bit USE ENTITY work.left_SIPO_n_bit(behavioral);
    SIGNAL clk : STD_LOGIC;
    SIGNAL rst : STD_LOGIC;
    SIGNAL en : STD_LOGIC;
    SIGNAL si : STD_LOGIC;
    SIGNAL d_out : STD_LOGIC_VECTOR (size - 1 DOWNTO 0);

    CONSTANT TbPeriod : TIME := 1000 ns; -- EDIT Put right period here
    SIGNAL TbClock : STD_LOGIC := '0';
    SIGNAL TbSimEnded : STD_LOGIC := '0';

BEGIN

    dut : left_SIPO_n_bit
    PORT MAP(
        clk => clk,
        rst => rst,
        en => en,
        si => si,
        d_out => d_out);

    -- Clock generation
    TbClock <= NOT TbClock AFTER TbPeriod/2 WHEN TbSimEnded /= '1' ELSE
        '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : PROCESS
    BEGIN
        -- EDIT Adapt initialization as needed
        en <= '0';
        si <= '0';
        d_out <= (OTHERS => '0');

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        WAIT FOR 100 ns;
        rst <= '0';
        WAIT FOR 100 ns;

        -- EDIT Add stimuli here
        WAIT FOR 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        WAIT;
    END PROCESS;

END tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

CONFIGURATION cfg_tb_left_SIPO_n_bit OF tb_left_SIPO_n_bit IS
    FOR tb
    END FOR;
END cfg_tb_left_SIPO_n_bit;
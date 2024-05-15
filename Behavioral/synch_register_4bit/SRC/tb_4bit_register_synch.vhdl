LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_reg_4bit_synch IS
END tb_reg_4bit_synch;

ARCHITECTURE behavior OF tb_reg_4bit_synch IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT reg_4bit_synch
    PORT(
        clk : IN  std_logic;
        rst : IN  std_logic;
        we : IN  std_logic;
        d_in : IN  std_logic_vector(3 downto 0);
        d_out : OUT  std_logic_vector(3 downto 0)
    );
    END COMPONENT;
    FOR ALL: reg_4bit_synch USE ENTITY work.reg_4bit_synch(behavioral);

    -- Inputs
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal we : std_logic := '0';
    signal d_in : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs
    signal d_out : std_logic_vector(3 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: reg_4bit_synch PORT MAP (
        clk => clk,
        rst => rst,
        we => we,
        d_in => d_in,
        d_out => d_out
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the register
        rst <= '1';
        wait for clk_period*2;
        rst <= '0';
        wait for clk_period*2;

        -- Write 1010 to the register
        we <= '1';
        d_in <= "1010";
        wait for clk_period*2;
        
        -- Disable write enable
        we <= '0';
        wait for clk_period*2;

        -- Write 1100 to the register but it should not be latched as we is '0'
        d_in <= "1100";
        wait for clk_period*2;

        -- Write enable again and write 0110 to the register
        we <= '1';
        d_in <= "0110";
        wait for clk_period*2;

        -- Reset the register again
        rst <= '1';
        wait for clk_period*2;
        rst <= '0';
        wait for clk_period*2;

        -- Stop the simulation
        wait;
    end process;

END;

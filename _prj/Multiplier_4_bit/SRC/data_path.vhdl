LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY data_path IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        a_reg_we : IN STD_LOGIC;
        a_reg_sh : IN STD_LOGIC;
        b_reg_we : IN STD_LOGIC;
        b_reg_sh : IN STD_LOGIC;
        r_reg_we : IN STD_LOGIC;

        a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        r : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END data_path;

ARCHITECTURE struct OF data_path IS
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

    COMPONENT register_n_bit IS
        GENERIC (size : INTEGER := 4);
        PORT (
            clk, rst, we : IN STD_LOGIC;
            d_in : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
            d_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)

        );
    END COMPONENT;
    FOR ALL : register_n_bit USE ENTITY work.register_n_bit(behavioral);

    COMPONENT right_PISO_n_bit IS
        GENERIC (size : INTEGER := 4);
        PORT (
            clk, rst, we, sh : IN STD_LOGIC;
            d_in : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
            so : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : right_PISO_n_bit USE ENTITY work.right_PISO_n_bit(behavioral);

    COMPONENT left_shift_reg_n_bit IS
        GENERIC (size : INTEGER := 4);
        PORT (
            clk, rst, we, sh : IN STD_LOGIC;
            d_in : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
            d_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)
        );
    END COMPONENT;
    FOR ALL : left_shift_reg_n_bit USE ENTITY work.left_shift_reg_n_bit(behavioral);
    CONSTANT zero : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL a_reg_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL b_reg_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL r_reg_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL and_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL a_reg_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL b_reg_out : STD_LOGIC;
    SIGNAL r_reg_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    a_reg_in <= zero & a;
    b_reg_in <= b;
    r <= zero & r_reg_out;
    g0 : FOR i IN 0 TO 7 GENERATE
        and_out(i) <= a_reg_out(i) AND b_reg_out;
    END GENERATE;

    add : full_adder_n_bit GENERIC MAP(8)PORT MAP
    (
    a => r_reg_out,
    b => and_out,
    cin => '0',
    sum => r_reg_in,
    cout => OPEN);
    r_reg : register_n_bit GENERIC MAP(8)PORT MAP
    (
    clk => clk,
    rst => rst,
    we => r_reg_we,
    d_in => r_reg_in,
    d_out => r_reg_out
    );
    a_reg : left_shift_reg_n_bit GENERIC MAP(8) PORT MAP
    (
    clk => clk,
    rst => rst,
    we => a_reg_we,
    sh => a_reg_sh,
    d_in => a_reg_in,
    d_out => a_reg_out
    );
    b_reg : right_PISO_n_bit GENERIC MAP(4) PORT MAP
    (
    clk => clk,
    rst => rst,
    we => b_reg_we,
    sh => b_reg_sh,
    d_in => b_reg_in,
    so => b_reg_out
    );

END ARCHITECTURE;
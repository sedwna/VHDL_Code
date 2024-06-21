LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_4_bit IS
    PORT (
        clk, rst, we : IN STD_LOGIC;
        d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        d_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

    );
END reg_4_bit;

ARCHITECTURE behavioral OF reg_4_bit IS
    CONSTANT zero: STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN
            IF (rst = '1') THEN
                d_out <= zero;
            ELSIF (we = '1') THEN
                d_out <= d_in;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE;
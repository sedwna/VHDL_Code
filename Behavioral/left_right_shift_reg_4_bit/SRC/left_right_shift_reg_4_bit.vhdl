LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- s1 = 0 and s2 = 0 // hold local data, no change in output
-- s1 = 1 and s2 = 0 // left shift
-- s1 = 0 and s2 = 1 // right shift
-- s1 = 1 and s2 = 1 // load input on ports
ENTITY left_right_shift_reg_4_bit IS
    PORT (
        clk, s1, s2 : IN STD_LOGIC;
        d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        d_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END left_right_shift_reg_4_bit;

ARCHITECTURE behavioral OF left_right_shift_reg_4_bit IS

    SIGNAL temp : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk = '0' AND clk'event) THEN
            IF (s1 = '0' AND s2 = '0') THEN
                temp <= temp;
            ELSIF (s1 = '1' AND s2 = '0') THEN
                temp <= temp(2 DOWNTO 0) & '0';
            ELSIF (s1 = '0' AND s2 = '1') THEN
                temp <= '0' & temp(3 DOWNTO 1);
            ELSIF (s1 = '1' AND s2 = '1') THEN
                temp <= d_in;
            END IF;
        END IF;
    END PROCESS;
    d_out <= temp;

END ARCHITECTURE;
-- Sajad Dehqan
-- 40012358014
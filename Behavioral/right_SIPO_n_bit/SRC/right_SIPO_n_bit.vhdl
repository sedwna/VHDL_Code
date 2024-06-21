LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY right_SIPO_n_bit IS
    GENERIC (size : INTEGER := 4);
    PORT (
        clk, rst, en, si : IN STD_LOGIC; -- enable and serial input
        d_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)
    );
END right_SIPO_n_bit;

ARCHITECTURE behavioral OF right_SIPO_n_bit IS

    SIGNAL zero : STD_LOGIC_VECTOR(size - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL temp : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);

BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN -- positive edge
            IF (rst = '1') THEN
                temp <= zero;
            ELSIF (en = '1') THEN
                temp <= si & temp(size - 1 DOWNTO 1);
            END IF;
        END IF;
    END PROCESS;
    d_out <= temp;

END behavioral;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY upDown_counter_n_bit IS
    GENERIC (size : INTEGER := 4);
    PORT (
        clk, rst, en, ud : IN STD_LOGIC; -- ud == 1 -> up counting ; ud == 0 -> down counting
        data_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)
    );
END upDown_counter_n_bit;

ARCHITECTURE behavioral OF upDown_counter_n_bit IS

    CONSTANT zero : STD_LOGIC_VECTOR(size - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL temp : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);

BEGIN
    PROCESS (clk)

    BEGIN
        IF (clk = '1' AND clk'event) THEN
            IF (rst = '1') THEN
                temp <= zero;

            ELSIF (en = '1') THEN
                IF (ud = '1') THEN
                    temp <= temp + 1; -- 1 USE ieee.std_logic_unsigned.ALL and auto change 1 to 0001

                ELSE
                    temp <= temp - 1; -- 1 USE ieee.std_logic_unsigned.ALL and auto change 1 to 0001
                END IF;

            END IF;

        END IF;
    END PROCESS;
    data_out <= temp;
END ARCHITECTURE;
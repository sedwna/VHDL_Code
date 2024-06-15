LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY seq_det_1011_mealy IS
    PORT (
        clk, rst, d : IN STD_LOGIC;
        det : OUT STD_LOGIC
    );
END seq_det_1011_mealy;

ARCHITECTURE behavioral OF seq_det_1011_mealy IS
    TYPE state IS (start, get_1, get_10, get_101, get_1011);
    SIGNAL next_state, current_state : state;

BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN

            IF (rst = '1') THEN
                current_state <= start;
            ELSE
                current_state <= next_state;
            END IF;

        END IF;
    END PROCESS;

    PROCESS (current_state, d)
    BEGIN
        CASE current_state IS
            WHEN start =>
                IF (d = '0') THEN
                    next_state <= start;
                    det <='0';
                ELSE
                    next_state <= get_1;
                    det <='0';
                END IF;
            WHEN get_1 =>
                IF (d = '0') THEN
                    next_state <= get_10;
                    det <='0';
                ELSE
                    next_state <= get_1;
                    det <='0';
                END IF;
            WHEN get_10 =>
                IF (d = '0') THEN
                    next_state <= start;
                    det <='0';
                ELSE
                    next_state <= get_101;
                    det <='0';
                END IF;
            WHEN get_101 =>
                IF (d = '0') THEN
                    next_state <= get_10;
                    det <='0';
                ELSE
                    next_state <= get_1;
                    det <='1';
                END IF;

            WHEN OTHERS =>
                next_state <= start;

        END CASE;

    END PROCESS;


END ARCHITECTURE;
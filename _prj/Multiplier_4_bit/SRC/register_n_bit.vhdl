LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_n_bit IS
    GENERIC (size : INTEGER := 4);
    PORT (
        clk, rst, we : IN STD_LOGIC;
        d_in : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
        d_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)

    );
END register_n_bit;

ARCHITECTURE behavioral OF register_n_bit IS
    CONSTANT zero : STD_LOGIC_VECTOR(size - 1 DOWNTO 0) := (OTHERS => '0');
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
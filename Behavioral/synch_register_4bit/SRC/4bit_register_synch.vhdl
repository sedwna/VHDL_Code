LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY reg_4bit_synch IS
    PORT (
        clk, rst, we : IN STD_LOGIC;
        d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        d_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END reg_4bit_synch;

ARCHITECTURE behavioral OF reg_4bit_synch IS
    SIGNAL temp : STD_LOGIC_VECTOR(3 DOWNTO 0);
    CONSTANT zero : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk = '0' AND clk'Event) THEN
            IF (rst = '1') THEN
                temp <= zero;
            ELSIF (we = '1') THEN
                temp <= d_in;
            END IF;
        END IF;
    END PROCESS;
    d_out <= temp;

END behavioral;
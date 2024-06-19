LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY distributed_ram IS
    PORT (
        clk : IN STD_LOGIC;
        we : IN STD_LOGIC;
        adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

        data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END distributed_ram;

ARCHITECTURE behavioral OF distributed_ram IS

    TYPE ram_type IS ARRAY(7 DOWNTO 0) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL my_ram : ram_type;

BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN
            IF (we = '1') THEN
                my_ram(CONV_INTEGER(adr)) <= data_in;
            END IF;

        END IF;

    END PROCESS;

    data_out <= my_ram(CONV_INTEGER(adr));

END ARCHITECTURE;
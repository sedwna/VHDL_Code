LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_dynamic_rom IS
    GENERIC (
        adr_size : INTEGER := 3;
        data_size : INTEGER := 16);
END test_dynamic_rom;

ARCHITECTURE test OF test_dynamic_rom IS
    COMPONENT dynamic_rom IS
        GENERIC (
            adr_size : INTEGER := 3;
            data_size : INTEGER := 16);

        PORT (
            clk, re : IN STD_LOGIC;--clock and read enable
            adr : IN STD_LOGIC_VECTOR(adr_size - 1 DOWNTO 0);
            data : OUT STD_LOGIC_VECTOR(data_size - 1 DOWNTO 0)

        );
    END COMPONENT;
    FOR ALL : dynamic_rom USE ENTITY work.dynamic_rom(behavioral);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL re : STD_LOGIC;
    SIGNAL adr : STD_LOGIC_VECTOR(adr_size - 1 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(data_size - 1 DOWNTO 0);
BEGIN

    uut : dynamic_rom GENERIC MAP(adr_size, data_size) PORT MAP(clk, re, adr, data);
    clk <= NOT clk AFTER 5 ns;
    re <= '0', '1' AFTER 30 ns, '0' AFTER 90 ns;
    adr <= "000", "001" AFTER 40 ns, "010" AFTER 50 ns, "011" AFTER 60 ns, "100" AFTER 70 ns, "101" AFTER 80 ns, "111" AFTER 90 ns;

END ARCHITECTURE;
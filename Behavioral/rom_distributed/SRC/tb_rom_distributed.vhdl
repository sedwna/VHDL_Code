LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_rom_distributed IS
END test_rom_distributed;

ARCHITECTURE test OF test_rom_distributed IS
    COMPONENT rom_distributed IS
        PORT (
            adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

        );
    END COMPONENT;
    FOR ALL : rom_distributed USE ENTITY work.rom_distributed(behavioral);

    SIGNAL adr : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

    uut : rom_distributed PORT MAP(adr, data);

    adr <= "000", "001" AFTER 40 ns, "010" AFTER 50 ns, "011" AFTER 60 ns, "100" AFTER 70 ns, "101" AFTER 80 ns, "111" AFTER 90 ns;

END ARCHITECTURE;
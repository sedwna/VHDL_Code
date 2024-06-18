LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY rom_distributed IS
    PORT (
        adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

    );
END rom_distributed;

ARCHITECTURE behavioral OF rom_distributed IS

    TYPE rom_distributed_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    CONSTANT my_rom_distributed : rom_distributed_type :=
    (
    X"0123", X"4567", X"89AB", X"CDEF",
    X"AAAA", X"BBBB", X"CCCC", X"DDDD"
    );

BEGIN

    data <= my_rom_distributed(CONV_INTEGER(adr));
END ARCHITECTURE;
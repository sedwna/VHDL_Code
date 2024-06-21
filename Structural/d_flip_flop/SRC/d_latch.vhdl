LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY d_latch IS
    PORT (
        c, rst, d : IN BIT;
        q, q_bar : OUT BIT
    );
END d_latch;
ARCHITECTURE struct OF d_latch IS
    SIGNAL t0, t1, t2, t3 : BIT;
BEGIN
    t3 <= d AND c AND (NOT rst);
    t2 <= ((NOT d) AND (c)) OR rst;
    t1 <= t3 NOR t0;
    t0 <= t1 NOR t2;
    q <= t0;
    q_bar <= t1;
END ARCHITECTURE;
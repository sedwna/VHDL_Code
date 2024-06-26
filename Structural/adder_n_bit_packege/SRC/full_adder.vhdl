LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
    PORT (
        a, b, cin : IN STD_LOGIC;
        sum, cout : OUT STD_LOGIC
    );
END full_adder;

ARCHITECTURE struct OF full_adder IS

BEGIN
    sum <= a XOR b XOR cin;
    cout <= (a AND b) OR (b AND cin) OR (cin AND a);
END ARCHITECTURE;

-- Sajad Dehqan
-- 40012358014
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tri_state_buffer IS
    PORT (
        a, c : IN STD_LOGIC;
        x : OUT STD_LOGIC
    );
END tri_state_buffer;
ARCHITECTURE dataflow OF ent IS
BEGIN
    x <= a WHEN(c = '1') ELSE
        'Z';
    
END ARCHITECTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity color_code_decoder is
Port (
    i_test_reg : in STD_LOGIC_VECTOR (31 downto 0); -- test api
    o_color_code_24bits : out STD_LOGIC_VECTOR (23 downto 0)
);
end color_code_decoder;

architecture Behavioral of color_code_decoder is
begin

    o_color_code_24bits <= i_test_reg(23 downto 0);

end Behavioral;

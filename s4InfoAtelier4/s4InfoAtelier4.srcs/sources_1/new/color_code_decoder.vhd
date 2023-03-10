library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity color_code_decoder is
Port (
    i_color_code_9bits  : in STD_LOGIC_VECTOR (8 downto 0);
    o_color_code_24bits : out STD_LOGIC_VECTOR (23 downto 0)
);
end color_code_decoder;

architecture Behavioral of color_code_decoder is

    signal signal_color_code_24bits : STD_LOGIC_VECTOR (23 downto 0);
    signal signal_red               : STD_LOGIC_VECTOR(7 downto 0);
    signal signal_blue              : STD_LOGIC_VECTOR(7 downto 0);
    signal signal_green             : STD_LOGIC_VECTOR(7 downto 0);
    
begin

    signal_red <= i_color_code_9bits(8 downto 6)&"00000";
    signal_blue <= i_color_code_9bits(2 downto 0)&"00000";
    signal_green <= i_color_code_9bits(5 downto 3)&"00000";
    
    signal_color_code_24bits(23 downto 16) <= signal_red;
    signal_color_code_24bits(15 downto 8) <= signal_blue;
    signal_color_code_24bits(7 downto 0) <= signal_green;
    
    o_color_code_24bits <= signal_color_code_24bits;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity send_to_hdmi is
Port ( 
    clk : in std_logic;
    rstn : in std_logic;
    i_x_hdmi : in std_logic_vector(11 downto 0);
    i_y_hdmi : in std_logic_vector(11 downto 0);
    o_dataValid : out std_logic;
    o_dataPixel : out std_logic_vector(23 downto 0);
    i_color_code_24bits_of_pixel_to_send : in std_logic_vector(23 downto 0)
);
end send_to_hdmi;

architecture Behavioral of send_to_hdmi is

begin

o_dataValid <= '1';
process(i_x_hdmi, i_y_hdmi)
begin
   o_dataPixel <= i_color_code_24bits_of_pixel_to_send;
end process;



end Behavioral;

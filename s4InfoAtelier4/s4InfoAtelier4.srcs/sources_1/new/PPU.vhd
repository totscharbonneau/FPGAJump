library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PPU is
Port (
    clk                 : in STD_LOGIC;
    reset               : in STD_LOGIC;
    i_reg0              : in STD_LOGIC_VECTOR (31 downto 0);
    i_reg1              : in STD_LOGIC_VECTOR (31 downto 0);
    i_reg2              : in STD_LOGIC_VECTOR (31 downto 0);
    i_reg3              : in STD_LOGIC_VECTOR (31 downto 0);
    
    i_x_hdmi            : in STD_LOGIC_VECTOR (11 downto 0);
    i_y_hdmi            : in STD_LOGIC_VECTOR (11 downto 0);
    
    o_color_code_24bits : out STD_LOGIC_VECTOR (23 downto 0)
);
end PPU;

architecture Behavioral of PPU is

    component color_code_decoder is
    Port (
        i_color_code_9bits  : in STD_LOGIC_VECTOR (8 downto 0);
        o_color_code_24bits : out STD_LOGIC_VECTOR (23 downto 0)
    );
    end component;
    
begin

    inst_color_code_decoder : color_code_decoder
    Port map (
        i_color_code_9bits => i_reg2(8 downto 0), -- test_alex
        o_color_code_24bits => o_color_code_24bits
    );

end Behavioral;

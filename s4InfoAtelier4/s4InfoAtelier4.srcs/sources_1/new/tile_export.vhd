----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 01:22:27 PM
-- Design Name: 
-- Module Name: tile_export - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tile_export is
    Port ( i_clk : in STD_LOGIC;
           i_pos_x : in STD_LOGIC_VECTOR (3 downto 0);
           i_pos_y : in STD_LOGIC_VECTOR (3 downto 0);
           i_color_id : in STD_LOGIC_VECTOR (8 downto 0);
           i_tile_id : in STD_LOGIC_VECTOR (7 downto 0);
           o_color_id : out STD_LOGIC_VECTOR (8 downto 0);
           i_en : in STD_LOGIC);
end tile_export;

architecture Behavioral of tile_export is

component register9bitsx88888
port (
   i_clk : in STD_LOGIC;
   i_en : in STD_LOGIC;
   i_address : in STD_LOGIC_VECTOR (14 downto 0);
   i_next_value : in STD_LOGIC_VECTOR (8 downto 0);
   o_current_value : out STD_LOGIC_VECTOR (8 downto 0)
);
end component;

signal i_address : std_logic_vector (14 downto 0);
signal i_select : std_logic_vector (1 downto 0);


begin

process(i_en,i_pos_x)
begin
    if(i_en = '1') then
           case (i_pos_x(3)) is
              when '0' =>
                 i_select <= "01";
              when '1' =>
                 i_select <= "10";
              when others =>
                 i_select <= "00";
       end case;
    else
        i_select <= "00";
    end if;
end process;

i_address(14 downto 12) <= i_pos_x(2 downto 0);
i_address(11 downto 8) <= i_pos_y;
i_address(7 downto 0) <= i_tile_id;

inst_register9bitsx8_0 : register9bitsx88888
port map (
   i_clk => i_clk,
   i_en => i_select(0),
   i_address => i_address,
   i_next_value => i_color_id,
   o_current_value => o_color_id
);

inst_register9bitsx8_1 : register9bitsx88888
port map (
   i_clk => i_clk,
   i_en => i_select(1),
   i_address => i_address,
   i_next_value => i_color_id,
   o_current_value => o_color_id
);

end Behavioral;

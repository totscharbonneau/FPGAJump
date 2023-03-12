----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 02:03:39 PM
-- Design Name: 
-- Module Name: tile_export_decoder - Behavioral
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

entity tile_export_decoder is
    Port ( i_tile_data : in STD_LOGIC_VECTOR (26 downto 0);
           o_position_x : out STD_LOGIC_VECTOR (3 downto 0);
           o_position_y : out STD_LOGIC_VECTOR (3 downto 0);
           o_color_id : out STD_LOGIC_VECTOR (8 downto 0);
           o_tile_id : out STD_LOGIC_VECTOR (9 downto 0));
end tile_export_decoder;

architecture Behavioral of tile_export_decoder is

begin

    o_position_x <= i_tile_data(26 downto 23);
    o_position_y <= i_tile_data(22 downto 19);
    o_color_id <= i_tile_data(18 downto 10);
    o_tile_id <= i_tile_data(9 downto 0);

end Behavioral;

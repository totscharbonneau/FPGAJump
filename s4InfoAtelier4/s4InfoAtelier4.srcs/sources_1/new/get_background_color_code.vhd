----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 05:26:23 PM
-- Design Name: 
-- Module Name: get_background_color_code - Behavioral
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


entity get_background_color_code is
    Port ( i_tileID : in STD_LOGIC_VECTOR (7 downto 0);
           i_coord_pixelmap_backX : in STD_LOGIC_VECTOR (3 downto 0);
           i_coord_pixelmap_backY : in STD_LOGIC_VECTOR (3 downto 0);
           --i_tile_register 
           o_background_color_code : out STD_LOGIC_VECTOR (8 downto 0));
end get_background_color_code;

architecture Behavioral of get_background_color_code is


begin


end Behavioral;

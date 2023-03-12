----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 05:14:33 PM
-- Design Name: 
-- Module Name: get_tileID_from_coord_background - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity get_tileID_from_coord_background is
    Port ( i_coord_backgroundX : in STD_LOGIC_VECTOR (9 downto 0);
           i_coord_backgroundY : in STD_LOGIC_VECTOR (9 downto 0);
           --i_registre_tile_id
           o_tileID : out STD_LOGIC_VECTOR (7 downto 0));
end get_tileID_from_coord_background;

architecture Behavioral of get_tileID_from_coord_background is
signal coord_backgroundX, coord_backgroundY, coord_tileX, coord_tileY : integer;


begin
coord_backgroundX <= TO_INTEGER(unsigned(i_coord_backgroundX));
coord_backgroundY <= TO_INTEGER(unsigned(i_coord_backgroundY));

coord_tileX <= coord_backgroundX/16;
coord_tileY <= coord_backgroundY/16;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 04:59:04 PM
-- Design Name: 
-- Module Name: coord_background_to_pixelmap - Behavioral
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



entity coord_background_to_pixelmap is
    Port ( i_coord_backgroundX : in STD_LOGIC_VECTOR (9 downto 0);
           i_coord_backgroundY : in STD_LOGIC_VECTOR (9 downto 0);
           o_coord_pixelmap_backX : out STD_LOGIC_VECTOR (3 downto 0);
           o_coord_pixelmap_backY : out STD_LOGIC_VECTOR (3 downto 0));
end coord_background_to_pixelmap;

architecture Behavioral of coord_background_to_pixelmap is
signal coord_backgroundX, coord_backgroundY : integer;
begin

coord_backgroundX <= TO_INTEGER(unsigned(i_coord_backgroundX));
coord_backgroundY <= TO_INTEGER(unsigned(i_coord_backgroundY));

o_coord_pixelmap_backX <= std_logic_vector(to_unsigned(coord_backgroundX mod 16 ,4));
o_coord_pixelmap_backY <= std_logic_vector(to_unsigned(coord_backgroundY mod 16 ,4));


end Behavioral;

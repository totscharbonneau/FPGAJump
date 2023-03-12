----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 04:30:11 PM
-- Design Name: 
-- Module Name: coord_viewport_to_background - Behavioral
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


entity coord_viewport_to_background is
    Port ( i_viewportX : in STD_LOGIC_VECTOR (9 downto 0);
           i_viewportY : in STD_LOGIC_VECTOR (9 downto 0);
           i_liveX : in STD_LOGIC_VECTOR (9 downto 0);
           i_liveY : in STD_LOGIC_VECTOR (7 downto 0);
           o_coordbackgroundX : out STD_LOGIC_VECTOR (9 downto 0);
           o_coordbackgroundY : out STD_LOGIC_VECTOR (9 downto 0));
end coord_viewport_to_background;

architecture Behavioral of coord_viewport_to_background is
signal viewportX, viewportY, liveX, liveY: integer;
constant WIDTH_BACKGROUND : integer := 1024;
constant HEIGHT_BACKGROUND : integer := 1024;
begin

viewportX <= TO_INTEGER(unsigned(i_viewportX));
viewportY <= TO_INTEGER(unsigned(i_viewportY));
liveX <= TO_INTEGER(unsigned(i_liveX));
liveY <= TO_INTEGER(unsigned(i_liveY));

o_coordbackgroundX <= std_logic_vector(to_unsigned((viewportX + liveX) mod WIDTH_BACKGROUND ,10));
o_coordbackgroundY <= std_logic_vector(to_unsigned((viewportY + liveY) mod WIDTH_BACKGROUND ,10));

end Behavioral;

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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity coord_background_to_pixelmap is
    Port ( coord_backgroundX : in STD_LOGIC_VECTOR (9 downto 0);
           coord_backgroundY : in STD_LOGIC_VECTOR (9 downto 0);
           coord_pixelmap_backX : out STD_LOGIC_VECTOR (3 downto 0);
           coord_pixelmap_backX : out STD_LOGIC_VECTOR (3 downto 0));
end coord_background_to_pixelmap;

architecture Behavioral of coord_background_to_pixelmap is

begin


end Behavioral;

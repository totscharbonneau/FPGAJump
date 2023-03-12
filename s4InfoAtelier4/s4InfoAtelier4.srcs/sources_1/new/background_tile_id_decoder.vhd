----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 08:46:37 PM
-- Design Name: 
-- Module Name: background_tile_id - Behavioral
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

entity background_tile_id_decoder is
    Port ( i_background_data : in STD_LOGIC_VECTOR (19 downto 0);
           o_position_x : out STD_LOGIC_VECTOR (4 downto 0);
           o_position_y : out STD_LOGIC_VECTOR (4 downto 0);
           o_tile_id : out STD_LOGIC_VECTOR (9 downto 0));
end background_tile_id_decoder;

architecture Behavioral of background_tile_id_decoder is

begin

    o_position_x <= i_background_data(19 downto 15);
    o_position_y <= i_background_data(14 downto 10);
    o_tile_id <= i_background_data(9 downto 0);

end Behavioral;

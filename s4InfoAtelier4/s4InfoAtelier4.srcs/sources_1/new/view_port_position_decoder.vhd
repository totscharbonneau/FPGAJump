----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 08:40:16 PM
-- Design Name: 
-- Module Name: view_port_position - Behavioral
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

entity view_port_position_decoder is
    Port ( i_viewport_data : in STD_LOGIC_VECTOR (17 downto 0);
           o_position_x : out STD_LOGIC_VECTOR (8 downto 0);
           o_position_y : out STD_LOGIC_VECTOR (8 downto 0));
end view_port_position_decoder;

architecture Behavioral of view_port_position_decoder is

begin

    o_position_x <= i_viewport_data(17 downto 9);
    o_position_y <= i_viewport_data(8 downto 0);

end Behavioral;

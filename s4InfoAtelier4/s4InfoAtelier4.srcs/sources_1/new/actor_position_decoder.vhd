----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 08:49:31 PM
-- Design Name: 
-- Module Name: actor_position - Behavioral
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

entity actor_position_decoder is
    Port ( i_actor_data : in STD_LOGIC_VECTOR (26 downto 0);
           o_position_x : out STD_LOGIC_VECTOR (8 downto 0);
           o_position_y : out STD_LOGIC_VECTOR (8 downto 0);
           o_actor_selection : out STD_LOGIC_VECTOR (4 downto 0);
           o_def_layer : out STD_LOGIC_VECTOR (3 downto 0));
end actor_position_decoder;

architecture Behavioral of actor_position_decoder is

begin
    
    o_position_x <= i_actor_data(26 downto 18);
    o_position_y <= i_actor_data(17 downto 9);
    o_actor_selection <= i_actor_data(8 downto 4);
    o_def_layer <= i_actor_data(3 downto 0);

end Behavioral;

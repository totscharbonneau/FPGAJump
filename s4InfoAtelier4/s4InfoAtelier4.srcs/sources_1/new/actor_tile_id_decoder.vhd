----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 08:37:47 PM
-- Design Name: 
-- Module Name: actor_tile_id - Behavioral
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

entity actor_tile_id_decoder is
    Port ( i_actor_data : in STD_LOGIC_VECTOR (14 downto 0);
           o_actor_selection : out STD_LOGIC_VECTOR (4 downto 0);
           o_tile_id : out STD_LOGIC_VECTOR (9 downto 0));
end actor_tile_id_decoder;

architecture Behavioral of actor_tile_id_decoder is

begin
    
    o_actor_selection <= i_actor_data(14 downto 10);
    o_tile_id <= i_actor_data(9 downto 0);

end Behavioral;

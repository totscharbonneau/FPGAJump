----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 05:19:37 PM
-- Design Name: 
-- Module Name: register1bit - Behavioral
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

entity register1bit is
    Port ( i_clk : in STD_LOGIC;
           i_en : in STD_LOGIC;
           i_next_value : in STD_LOGIC;
           o_current_value : out STD_LOGIC);
end register1bit;

architecture Behavioral of register1bit is

begin

process(i_clk,i_en)
begin
    if(rising_edge(i_clk) AND i_en = '1') then
        o_current_value <= i_next_value;
    end if;
end process;

end Behavioral;

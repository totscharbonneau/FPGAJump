----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 01:08:35 PM
-- Design Name: 
-- Module Name: D4_16 - Behavioral
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

entity D4_16 is
    Port ( i_upcode : in STD_LOGIC_VECTOR (3 downto 0);
           o_en : out STD_LOGIC_VECTOR (15 downto 0));
end D4_16;

architecture Behavioral of D4_16 is

begin
process (i_upcode)
begin
case(i_upcode) is
    when "0000" =>
    o_en <= "0000000000000001";
    when "0001" =>
    o_en <= "0000000000000010";
    when "0010" =>
    o_en <= "0000000000000100";
    when "0011" =>
    o_en <= "0000000000001000";
    when "0100" =>
    o_en <= "0000000000010000";
    when "0101" =>
    o_en <= "0000000000100000";
    when "0110" =>
    o_en <= "0000000001000000";
    when "0111" =>
    o_en <= "0000000010000000";
    when "1000" =>
    o_en <= "0000000100000000";
    when "1001" =>
    o_en <= "0000001000000000";
    when "1010" =>
    o_en <= "0000010000000000";
    when "1011" =>
    o_en <= "0000100000000000";
    when "1100" =>
    o_en <= "0001000000000000";
    when "1101" =>
    o_en <= "0010000000000000";
    when "1110" =>
    o_en <= "0100000000000000";
    when "1111" =>
    o_en <= "1000000000000000";
 end case;
end process;

end Behavioral;

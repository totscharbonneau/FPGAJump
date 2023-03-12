----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 11:45:37 AM
-- Design Name: 
-- Module Name: Split_upcode - Behavioral
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

entity Split_upcode is
    Port ( i_reg : in STD_LOGIC_VECTOR (31 downto 0);
           o_upcode : out STD_LOGIC_VECTOR (3 downto 0);
           o_data : out STD_LOGIC_VECTOR (27 downto 0));
end Split_upcode;

architecture Behavioral of Split_upcode is

begin

o_upcode <= i_reg(31 downto 28);
o_data <= i_reg(27 downto 0);

end Behavioral;

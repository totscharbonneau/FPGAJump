----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 05:27:39 PM
-- Design Name: 
-- Module Name: register9bits - Behavioral
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

entity register9bits is
    Port ( i_clk : in STD_LOGIC;
           i_en : in STD_LOGIC;
           i_next_value : in STD_LOGIC_VECTOR (8 downto 0);
           o_current_value : out STD_LOGIC_VECTOR (8 downto 0));
end register9bits;

architecture Behavioral of register9bits is

component register1bit
port (
   i_clk : in STD_LOGIC;
   i_en : in STD_LOGIC;
   i_next_value : in STD_LOGIC;
   o_current_value : out STD_LOGIC
);
end component;

begin

inst_register1bit_0 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(0),
   o_current_value => o_current_value(0)
);

inst_register1bit_1 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(1),
   o_current_value => o_current_value(1)
);

inst_register1bit_2 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(2),
   o_current_value => o_current_value(2)
);

inst_register1bit_3 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(3),
   o_current_value => o_current_value(3)
);

inst_register1bit_4 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(4),
   o_current_value => o_current_value(4)
);

inst_register1bit_5 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(5),
   o_current_value => o_current_value(5)
);

inst_register1bit_6 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(6),
   o_current_value => o_current_value(6)
);

inst_register1bit_7 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(7),
   o_current_value => o_current_value(7)
);

inst_register1bit_8 : register1bit
port map (
   i_clk => i_clk,
   i_en => i_en,
   i_next_value => i_next_value(8),
   o_current_value => o_current_value(8)
);

end Behavioral;

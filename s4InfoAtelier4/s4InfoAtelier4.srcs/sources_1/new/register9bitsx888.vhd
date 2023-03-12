----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 06:26:15 PM
-- Design Name: 
-- Module Name: register9bitsx888 - Behavioral
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

entity register9bitsx888 is
  Port(i_clk : in STD_LOGIC;
       i_en : in STD_LOGIC;
       i_address : in STD_LOGIC_VECTOR (8 downto 0);
       i_next_value : in STD_LOGIC_VECTOR (8 downto 0);
       o_current_value : out STD_LOGIC_VECTOR (8 downto 0));
end register9bitsx888;

architecture Behavioral of register9bitsx888 is

component register9bitsx88
port (
   i_clk : in STD_LOGIC;
   i_en : in STD_LOGIC;
   i_address : in STD_LOGIC_VECTOR (5 downto 0);
   i_next_value : in STD_LOGIC_VECTOR (8 downto 0);
   o_current_value : out STD_LOGIC_VECTOR (8 downto 0)
);
end component;

signal i_address_one_hot : std_logic_vector (7 downto 0);

begin


process(i_en,i_address)
begin
    if(i_en = '1') then
           case (i_address(8 downto 6)) is
          when "000" =>
             i_address_one_hot <= "00000001";
          when "001" =>
             i_address_one_hot <= "00000010";
          when "010" =>
             i_address_one_hot <= "00000100";
          when "011" =>
             i_address_one_hot <= "00001000";
          when "100" =>
             i_address_one_hot <= "00010000";
          when "101" =>
             i_address_one_hot <= "00100000";
          when "110" =>
             i_address_one_hot <= "01000000";
          when "111" =>
             i_address_one_hot <= "10000000";
          when others =>
             i_address_one_hot <= "00000000";
       end case;
    else
        i_address_one_hot <= "00000000";
    end if;
end process;

inst_register9bitsx8_0 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(0),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);

inst_register9bitsx8_1 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(1),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);

inst_register9bitsx8_2 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(2),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);

inst_register9bitsx8_3 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(3),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);

inst_register9bitsx8_4 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(4),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);

inst_register9bitsx8_5 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(5),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);

inst_register9bitsx8_6 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(6),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);

inst_register9bitsx8_7 : register9bitsx88
port map (
   i_clk => i_clk,
   i_en => i_address_one_hot(7),
   i_address => i_address(5 downto 0),
   i_next_value => i_next_value,
   o_current_value => o_current_value
);



end Behavioral;

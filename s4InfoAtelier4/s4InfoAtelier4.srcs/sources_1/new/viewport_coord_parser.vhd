----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2023 02:34:18 PM
-- Design Name: 
-- Module Name: viewport_coord_parser - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity viewport_coord_parser is
    Port ( i_clk : in STD_LOGIC;
           i_endtick : in STD_LOGIC;
           o_x : out STD_LOGIC_VECTOR (9 downto 0);
           o_y : out STD_LOGIC_VECTOR (7 downto 0);
           o_coord_parser_end : out STD_LOGIC);
end viewport_coord_parser;

architecture Behavioral of viewport_coord_parser is
constant WIDTH : integer := 640; --640
constant HEIGHT : integer := 360; -- 360
signal row, col : integer := 0;
signal looping : boolean := false;


begin
process(i_clk)
begin
    if rising_edge(i_clk) then
        if looping then
         if col < WIDTH then
              o_x <= std_logic_vector(to_unsigned(col,10));
              o_y <= std_logic_vector(to_unsigned(row,8));
             col <= col + 1;
         else
             col <= 0;
             row <= row + 1;
          end if;
            if row = HEIGHT -1 and col = WIDTH - 1 then
             o_coord_parser_end <= '1';
             col <= 0;
             row <= 0;
             looping <= false;
          end if;
          elsif i_endtick = '1' then
                looping <= true;
                col <= 0;
                row <= 0;
                o_coord_parser_end <= '0';
        end if;
     end if;
    
end process;


end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ppu_api_decoder is
Port(
    i_reg0      : in std_logic_vector(31 downto 0);
    i_reg1      : in std_logic_vector(31 downto 0);
    i_reg2      : in std_logic_vector(31 downto 0);
    i_reg3      : in std_logic_vector(31 downto 0);
    o_test_reg  : out std_logic_vector(31 downto 0); -- test api
    o_tile_export : out std_logic_vector(27 downto 0);
    o_actor_tile_id : out std_logic_vector(27 downto 0);
    o_view_port_position : out std_logic_vector(27 downto 0);
    o_background_tile_id : out std_logic_vector(27 downto 0);
    o_actor_position : out std_logic_vector(27 downto 0);
    o_end_tick : out std_logic
);
end ppu_api_decoder;

architecture Behavioral of ppu_api_decoder is

begin

    process(i_reg0)
    begin
        case i_reg0(31 downto 28) is
        when "0001" => 
            o_tile_export <= i_reg0(27 downto 0);
        when "0010" => 
            o_actor_tile_id <= i_reg0(27 downto 12);
        when "0011" => 
            o_view_port_position <= i_reg0(27 downto 10);
        when "0100" => 
            o_background_tile_id <= i_reg0(27 downto 8);
        when "0101" => 
            o_actor_position <= i_reg0(27 downto 0);
        when "0110" => 
            o_end_tick <= '1';
        end case;
    end process;
    
    process(i_reg1)
    begin
        case i_reg1(31 downto 28) is
        when "0001" => 
            o_tile_export <= i_reg1(27 downto 0);
        when "0010" => 
            o_actor_tile_id <= i_reg1(27 downto 12);
        when "0011" => 
            o_view_port_position <= i_reg1(27 downto 10);
        when "0100" => 
            o_background_tile_id <= i_reg1(27 downto 8);
        when "0101" => 
            o_actor_position <= i_reg1(27 downto 0);
        when "0110" => 
            o_end_tick <= '1';
        end case;
    end process;
    
    process(i_reg2)
    begin
        case i_reg2(31 downto 28) is
        when "0001" => 
            o_tile_export <= i_reg2(27 downto 0);
        when "0010" => 
            o_actor_tile_id <= i_reg2(27 downto 12);
        when "0011" => 
            o_view_port_position <= i_reg2(27 downto 10);
        when "0100" => 
            o_background_tile_id <= i_reg2(27 downto 8);
        when "0101" => 
            o_actor_position <= i_reg2(27 downto 0);
        when "0110" => 
            o_end_tick <= '1';
        end case;
    end process;
    
    process(i_reg3)
    begin
        case i_reg3(31 downto 28) is
        when "0001" => 
            o_tile_export <= i_reg3(27 downto 0);
        when "0010" => 
            o_actor_tile_id <= i_reg3(27 downto 12);
        when "0011" => 
            o_view_port_position <= i_reg3(27 downto 10);
        when "0100" => 
            o_background_tile_id <= i_reg3(27 downto 8);
        when "0101" => 
            o_actor_position <= i_reg3(27 downto 0);
        when "0110" => 
            o_end_tick <= '1';
        end case;
    end process;
    
    o_test_reg <= i_reg2;

end Behavioral;

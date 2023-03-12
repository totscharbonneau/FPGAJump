library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PPU is
Port (
    clk                 : in STD_LOGIC;
    reset               : in STD_LOGIC;
    i_reg0              : in STD_LOGIC_VECTOR (31 downto 0);
    i_reg1              : in STD_LOGIC_VECTOR (31 downto 0);
    i_reg2              : in STD_LOGIC_VECTOR (31 downto 0);
    i_reg3              : in STD_LOGIC_VECTOR (31 downto 0);
    
    i_x_hdmi            : in STD_LOGIC_VECTOR (11 downto 0);
    i_y_hdmi            : in STD_LOGIC_VECTOR (11 downto 0);
    
    o_color_code_24bits : out STD_LOGIC_VECTOR (23 downto 0)
);
end PPU;

architecture Behavioral of PPU is

    component tile_export_decoder is
        port (
           i_tile_data : in STD_LOGIC_VECTOR (26 downto 0);
           o_position_x : out STD_LOGIC_VECTOR (3 downto 0);
           o_position_y : out STD_LOGIC_VECTOR (3 downto 0);
           o_color_id : out STD_LOGIC_VECTOR (8 downto 0);
           o_tile_id : out STD_LOGIC_VECTOR (9 downto 0)
        );
    end component;

    component color_code_decoder is
        Port (
            i_color_code_9bits  : in STD_LOGIC_VECTOR (8 downto 0);
            o_color_code_24bits : out STD_LOGIC_VECTOR (23 downto 0)
        );
    end component;
    
    -- Signals for tile export decoder
    signal s_tile_export : std_logic_vector(26 downto 0);
    signal s_tile_position_x : STD_LOGIC_VECTOR (3 downto 0);
    signal s_tile_position_y : STD_LOGIC_VECTOR (3 downto 0);
    signal s_tile_color_id : STD_LOGIC_VECTOR (8 downto 0);
    signal s_tile_tile_id : STD_LOGIC_VECTOR (9 downto 0);
    
    -- Signals for actor tile id decoder
    signal s_actor_tile_id : std_logic_vector(26 downto 0);
    
    -- Signals for view port position decoder
    signal s_view_port_position : std_logic_vector(26 downto 0);
    
    -- Signals for background tile id decoder
    signal s_background_tile_id : std_logic_vector(26 downto 0);
    
    -- Signals for actor position decoder
    signal s_actor_position : std_logic_vector(26 downto 0);
    
    -- Signals for end tick decoder
    signal s_end_tick : std_logic;
    
begin

    process(i_reg0)
    begin
        case i_reg0(31 downto 28) is
        when "0001" => 
            s_tile_export <= i_reg0(26 downto 0);
        when "0010" => 
            s_actor_tile_id <= i_reg0(26 downto 12);
        when "0011" => 
            s_view_port_position <= i_reg0(26 downto 10);
        when "0100" => 
            s_background_tile_id <= i_reg0(26 downto 8);
        when "0101" => 
            s_actor_position <= i_reg0(26 downto 0);
        when "0110" => 
            s_end_tick <= '1';
        end case;
    end process;
    
    process(i_reg1)
    begin
        case i_reg1(31 downto 28) is
        when "0001" => 
            s_tile_export <= i_reg1(26 downto 0);
        when "0010" => 
            s_actor_tile_id <= i_reg1(26 downto 12);
        when "0011" => 
            s_view_port_position <= i_reg1(26 downto 10);
        when "0100" => 
            s_background_tile_id <= i_reg1(26 downto 8);
        when "0101" => 
            s_actor_position <= i_reg1(26 downto 0);
        when "0110" => 
            s_end_tick <= '1';
        end case;
    end process;
    
    process(i_reg2)
    begin
        case i_reg2(31 downto 28) is
        when "0001" => 
           s_tile_export <= i_reg2(26 downto 0);
        when "0010" => 
            s_actor_tile_id <= i_reg2(26 downto 12);
        when "0011" => 
            s_view_port_position <= i_reg2(26 downto 10);
        when "0100" => 
            s_background_tile_id <= i_reg2(26 downto 8);
        when "0101" => 
            s_actor_position <= i_reg2(26 downto 0);
        when "0110" => 
            s_end_tick <= '1';
        end case;
    end process;
    
    process(i_reg3)
    begin
        case i_reg3(31 downto 28) is
        when "0001" => 
            s_tile_export <= i_reg3(26 downto 0);
        when "0010" => 
            s_actor_tile_id <= i_reg3(26 downto 12);
        when "0011" => 
            s_view_port_position <= i_reg3(26 downto 10);
        when "0100" => 
            s_background_tile_id <= i_reg3(26 downto 8);
        when "0101" => 
            s_actor_position <= i_reg3(26 downto 0);
        when "0110" => 
            s_end_tick <= '1';
        end case;
    end process;
    
    inst_tile_export_decoder : tile_export_decoder
    port map (
        i_tile_data => s_tile_export,
        o_position_x => s_tile_position_x,
        o_position_y => s_tile_position_y,
        o_color_id => s_tile_color_id,
        o_tile_id => s_tile_tile_id
    );

    inst_color_code_decoder : color_code_decoder
    Port map (
        i_color_code_9bits => i_reg2(8 downto 0), -- test_alex
        o_color_code_24bits => o_color_code_24bits
    );

end Behavioral;

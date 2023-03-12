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
    
    component color_code_decoder is
    Port (
        i_color_code_9bits  : in STD_LOGIC_VECTOR (8 downto 0);
        o_color_code_24bits : out STD_LOGIC_VECTOR (23 downto 0)
    );
    end component;
    
    component Split_upcode is
    Port ( i_reg : in STD_LOGIC_VECTOR (31 downto 0);
           o_upcode : out STD_LOGIC_VECTOR (3 downto 0);
           o_data : out STD_LOGIC_VECTOR (27 downto 0)
    );
    end component;
    
    component D4_16 is
     Port ( i_upcode : in STD_LOGIC_VECTOR (3 downto 0);
           o_en : out STD_LOGIC_VECTOR (15 downto 0)
     );
     end component;
     
    component tile_export is
     Port ( i_data : in STD_LOGIC_VECTOR (27 downto 0);
           i_en : in STD_LOGIC
           );
     end component;
    
    component viewport_coord_parser is
     Port ( i_clk : in STD_LOGIC;
           i_endtick : in STD_LOGIC;
           o_x : out STD_LOGIC_VECTOR (9 downto 0);
           o_y : out STD_LOGIC_VECTOR (7 downto 0);
           o_coord_parser_end : out STD_LOGIC
      );
      end component;
      
    component coord_viewport_to_background is
    Port ( i_viewportX : in STD_LOGIC_VECTOR (9 downto 0);
           i_viewportY : in STD_LOGIC_VECTOR (9 downto 0);
           i_liveX : in STD_LOGIC_VECTOR (9 downto 0);
           i_liveY : in STD_LOGIC_VECTOR (7 downto 0);
           o_coordbackgroundX : out STD_LOGIC_VECTOR (9 downto 0);
           o_coordbackgroundY : out STD_LOGIC_VECTOR (9 downto 0)
     );
     end component;
    
    signal i_data : std_logic_vector(27 downto 0);
    signal i_upcode : std_logic_vector(3 downto 0);
    signal v_enreg : std_logic_vector(15 downto 0);
    signal s_coord_viewportX : std_logic_vector (9 downto 0);
    signal s_coord_viewportY : std_logic_vector (7 downto 0);
    signal s_coord_parser_end : std_logic;
    signal s_coord_backgroundX : std_logic_vector (9 downto 0);
    signal s_coord_backgroundY : std_logic_vector (9 downto 0);
    
begin

    inst_Split_upcode : Split_upcode
    port map (
        i_reg => i_reg0,
        o_upcode => i_upcode,
        o_data => i_data
    );
   
   inst_decoder_upcode : D4_16
   port map(
        i_upcode => i_upcode,
        o_en => v_enreg
   );
   
    inst_color_code_decoder : color_code_decoder
    Port map (
        i_color_code_9bits => i_reg2(8 downto 0), -- test_alex
        o_color_code_24bits => o_color_code_24bits
    );
    
    inst_tile_export_process : tile_export
    Port map (
        i_data => i_data,
        i_en => v_enreg(1)
    );
    
    inst_viewport_coord_parser : viewport_coord_parser
    Port map (
        i_clk => clk,
        i_endtick => '0',
        o_x => s_coord_viewportX,
        o_y => s_coord_viewportY,
        o_coord_parser_end => s_coord_parser_end
    );
    
    inst_coord_viewport_to_background : coord_viewport_to_background
    Port map (
        i_viewportX => "0000000000", --temp value
        i_viewportY => "0000000000", --temp value
        i_liveX => s_coord_viewportX,
        i_liveY => s_coord_viewportY,
        o_coordbackgroundX => s_coord_backgroundX,
        o_coordbackgroundY => s_coord_backgroundY
    );
    
end Behavioral;

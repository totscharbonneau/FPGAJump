library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_viewport_coord_parser is
end tb_viewport_coord_parser;

architecture Behavioral of tb_viewport_coord_parser is

    -- Component declaration
    component viewport_coord_parser is
        Port ( 
            i_clk : in STD_LOGIC;
            i_endtick : in STD_LOGIC;
            o_x : out STD_LOGIC_VECTOR (9 downto 0);
            o_y : out STD_LOGIC_VECTOR (7 downto 0);
            o_coord_parser_end : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal tb_clk : STD_LOGIC := '0';
    signal tb_endtick : STD_LOGIC := '0';
    signal tb_x : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal tb_y : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal tb_coord_parser_end : STD_LOGIC := '0';

begin

    -- Instantiate the component
    DUT: viewport_coord_parser 
        port map (
            i_clk => tb_clk,
            i_endtick => tb_endtick,
            o_x => tb_x,
            o_y => tb_y,
            o_coord_parser_end => tb_coord_parser_end
        );

    -- Clock generation
    process
    begin
        tb_clk <= '0';
        wait for 10 ns;
        tb_clk <= '1';
        wait for 10 ns;
    end process;

    -- Stimulus process
    process
    begin
        wait for 10 ns;  -- wait for initial signals to stabilize
        tb_endtick <= '0';
        wait for 0.5 us;
        tb_endtick <= '1';
        wait for 20 ns;
        tb_endtick <= '0';
        wait for 2800 ns;
        tb_endtick <= '1';
        wait for 20 ns;
        tb_endtick <= '0';
    end process;

end Behavioral;

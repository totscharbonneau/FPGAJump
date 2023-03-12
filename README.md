# FPGAJump

# Format d'encodage
                    Tile_export
Opcode  Update	Position X	Position Y	Color id	Tile id
0001	1 bit   4 bits	    4 bits	    8 bits	    10 bits

                    Actor_tile_id
Opcode  Update	Select actor    Tile id	    N/A
0010	1 bit   5 bits	        10 bits	    12 bits

                    View_port_position
Opcode	Update      Position X	Position Y	N/A
0011	1 bit       9 bits	    9 bits	    9 bits

                    Background_tile_id
Opcode	Update      Position X	Position Y	Tile id	    N/A
0100	1 bit       5 bits	    5 bits	    10 bits	    7 bits

                    Actor_position
Opcode	Update      Position X	Position Y	Select actor	Def layer
0101	i bit       9 bits	    9 bits	    5 bits	        4 bits

                    End_tick
Opcode	    Update      N/A
0110	    1 bit       27 bits

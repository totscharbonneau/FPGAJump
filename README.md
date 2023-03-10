# FPGAJump

# Procedure to export bitstream to Vitis
--- In Vivado ---
1.  Generate bitstream
2.  File -> Export -> Export hardware -> `include bitstream`
3.  Tools -> Launch Vitis
--- In Vitis ---
4.  Right click ont the wrapper -> Update hardware specifications
5.  Right click the wrapper -> Build project
6.  Right click on project -> Build project
7.  Right click on project_system -> Program device
8.  Right click on project -> Run as -> 1

# Format d'encodage
                    Tile_export
Opcode	Position X	Position Y	Color id	Tile id
0001	4 bits	    4 bits	    8 bits	    12 bits

                    Actor_tile_id
Opcode	Select actor    Tile id	    N/A
0010	5 bits	        12 bits	    11 bits

                    View_port_position
Opcode	Position X	Position Y	N/A
0011	9 bits	    9 bits	    10 bits

                    Background_tile_id
Opcode	Position X	Position Y	Tile id	    N/A
0100	5 bits	    5 bits	    12 bits	    7 bits

                    Actor_position
Opcode	Position X	Position Y	Select actor	Def layer
0101	9 bits	    9 bits	    5 bits	        5 bits

                    End_tick
Opcode	N/A
0110	28 bits

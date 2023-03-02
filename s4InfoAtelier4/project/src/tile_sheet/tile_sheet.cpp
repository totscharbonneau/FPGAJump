#include <iostream>
#include <fstream>
#include "tile_sheet.h"

namespace
{
    const char* tile_sheet_path = "../tiles_images/generated_tiles.txt";
}

tile_sheet::tile_sheet()
{
    clean_all_tiles();
    import_tiles();
}

tile_sheet::~tile_sheet()
{
}

void tile_sheet::clean_all_tiles()
{
    all_tiles =
    {
        {PLAYER_TILE, {}},
        {PLATFORM_LEFT_TILE, {}},
        {PLATFORM_MID_TILE, {}},
        {PLATFORM_RIGHT_TILE, {}},
        {PLATFORM_ONE_TILE, {}},
        {BACKGROUND_TILE, {}}
    };
}

/*
 * Fill tile_list with the tiles' info from
 * the generated file
 */
void tile_sheet::import_tiles()
{
    int id_count = 0;
    int x, y = 0;
    int tile_x, tile_y = 0;
    tile_type current_type = WRONG_TILE;

    std::string value;
    std::ifstream file(tile_sheet_path);
    if (file.is_open())
    {
        while (file.eof())
        {
            file >> value;

            if (current_type == WRONG_TILE)
            {
                // Looking for new tile
                if (tile_type_name_map.count(value))
                {
                    // Found new tile
                    current_type = tile_type_name_map.at(value);
                    file >> tile_x;
                    file >> tile_y;

                    file >> value;
                    if (value.compare(":") == 0)
                    {
                        tile_info new_tile_info = {id_count++, {}};
                        all_tiles.at(current_type).list[tile_x][tile_y] = new_tile_info;
                    }
                    else
                    {
                        // Problem while parsing new pixelmap dimension
                        current_type = WRONG_TILE;
                        tile_x = 0;
                        tile_y = 0;
                    }
                }
            }
            else
            {
                // Working on a tile
                if (value.compare(";") == 0)
                {
                    // End of tile
                    current_type = WRONG_TILE;
                    x = 0;
                    y = 0;
                }
                else
                {
                    // Add color code to pixelmap
                    all_tiles.at(current_type).list[tile_x][tile_y].pixelmap[x][y] = std::stoi(value);
                    if (x++ >= TILE_SIZE)
                    {
                        x = 0;
                        y ++;
                        if (y >= TILE_SIZE)
                        {
                            // Should not have more than 16 rows
                        }
                    }
                }
            }
        }
        file.close();
    }
    else
    {
        // Could not open file
    }
}

tile_info tile_sheet::get_tile_info(tile_type type, int x, int y)
{
    return all_tiles[type].list[x][y];
}
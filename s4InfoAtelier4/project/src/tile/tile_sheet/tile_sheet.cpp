#include <iostream>
#include <fstream>
#include "tile_sheet.h"

// TODO: Change absolute path to relative
const char* tile_sheet_path = "C:/Travail/tiles_images/generated_tiles.txt";

tile_sheet::tile_sheet()
{
    all_element_tiles.insert({PLAYER_TILE, new tile_info});
    all_element_tiles.insert({PLATFORM_LEFT_TILE, new tile_info});
    all_element_tiles.insert({PLATFORM_MID_TILE, new tile_info});
    all_element_tiles.insert({PLATFORM_RIGHT_TILE, new tile_info});
    all_element_tiles.insert({PLATFORM_ONE_TILE, new tile_info});

    // for (int i = 0; i < TILE_SIZE; i++)
    // {
    //     for (int j = 0; j < TILE_SIZE; j++)
    //     {
    //         all_background_tiles[i][j] = nullptr;
    //     }
    // }
    import_tiles();
}

tile_sheet::~tile_sheet()
{
    // Delete elements tile_info
    all_element_tiles.clear();

    // Delete background tile_info
    // for (int i = 0; i < MAX_TILE_SIZE_BACKGROUND; i++)
    // {
    //     for (int j = 0; j < MAX_TILE_SIZE_BACKGROUND; j++)
    //     {
    //         if (all_background_tiles[i][j] != nullptr)
    //         {
    //             delete all_background_tiles[i][j];
    //         }
    //     }
    // }
}

/*
 * Fill tile_list with the tiles' info from
 * the generated file
 */
void tile_sheet::import_tiles()
{
    int id_count = 0;
    int x = 0;
    int y = 0;
    int tile_x = 0;
    int tile_y = 0;
    tile_type current_type = WRONG_TILE;

    std::string value;
    std::ifstream file(tile_sheet_path);
    if (file.is_open())
    {
        while (!file.eof())
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
                        // Name parsing is valid so creating new tile_info with valid id
                        if (current_type == BACKGROUND_TILE && 
                            tile_x < MAX_TILE_SIZE_BACKGROUND &&
                            tile_y < MAX_TILE_SIZE_BACKGROUND)
                        {
                            if (all_background_tiles[tile_x][tile_y] == nullptr)
                            {
                                all_background_tiles[tile_x][tile_y] = new tile_info();
                            }
                            // else
                            // {
                            //     all_background_tiles[tile_x][tile_y]->clean_tile_info();
                            // }
                            // all_background_tiles[tile_x][tile_y]->tile_id = id_count++;
                        }
                        else
                        {
                            all_element_tiles[current_type]->tile_id = id_count++;
                        }
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
                    if (current_type == BACKGROUND_TILE)
                    {
                        // all_background_tiles[tile_x][tile_y]->pixelmap[x][y] = (short)std::stoi(value);
                    }
                    else
                    {
                        all_element_tiles[current_type]->pixelmap[x][y] = (short)std::stoi(value);
                    }

                    if (x++ >= TILE_SIZE)
                    {
                        x = 0;
                        y ++;
                        if (y >= TILE_SIZE)
                        {
                            // Should not have more than 16 rows
                            // TODO: handle error
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
        // TODO: handle error
    }
}

tile_info* tile_sheet::get_tile_info(tile_type type, int x, int y)
{
    if (type == BACKGROUND_TILE)
    {
        return all_background_tiles[x][y];
    }
    else
    {
        return all_element_tiles[type];
    }
}
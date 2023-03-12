#include "tile_info.h"

tile_info::tile_info()
{
    clean_tile_info();
}

tile_info::~tile_info()
{

}

void tile_info::clean_tile_info()
{
    tile_id = INVALID_TILE_ID;
    for (int i = 0; i < TILE_SIZE; i++)
    {
        for (int j = 0; j < TILE_SIZE; j++)
        {
            pixelmap[i][j] = 0;
        }
    }
}
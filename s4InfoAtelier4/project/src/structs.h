#ifndef STRUCTS_H
#define STRUCTS_H

#include "constants.h"

struct tile_info
{
    int tile_id;
    short pixelmap[TILE_SIZE][TILE_SIZE];
};

struct tile_list
{
    tile_info list[MAX_TILE_IN_BACKGROUND][MAX_TILE_IN_BACKGROUND];
};


#endif // STRUCTS_H
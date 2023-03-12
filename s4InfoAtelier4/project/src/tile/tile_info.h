#ifndef TILE_INFO_H
#define TILE_INFO_H

#include "../constants.h"

class tile_info
{
public:
    int tile_id;
    short pixelmap[TILE_SIZE][TILE_SIZE];

    tile_info();
    ~tile_info();

    void clean_tile_info();
};

#endif // TILE_INFO_H
